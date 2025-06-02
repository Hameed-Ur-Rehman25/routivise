import 'dart:math';

import '../../presentation/utils/goal_colors.dart';
import '../models/goal_model.dart';
import 'goal_datasource.dart';

class LocalGoalDataSource implements GoalDataSource {
  // In-memory storage for goals
  List<GoalModel> _goals = [];

  // Singleton instance
  static final LocalGoalDataSource _instance = LocalGoalDataSource._internal();

  factory LocalGoalDataSource() => _instance;

  LocalGoalDataSource._internal() {
    // Initialize with some mock data
    _initializeMockData();
  }

  void _initializeMockData() {
    _goals = [
      GoalModel(
        id: '1',
        title: 'Squats today',
        description: 'Need to do 30 squats today!',
        time: DateTime(2025, 6, 2, 11, 5),
        goalType: 'Exercise',
        isDone: true,
        iconPath: 'assets/icons/workout_icon.png',
      ),
      GoalModel(
        id: '2',
        title: 'Drink Water',
        description: 'need to drink more water',
        time: DateTime(2025, 6, 2, 11, 0),
        goalType: 'Health',
        isDone: true,
        iconPath: 'assets/icons/water_icon.png',
      ),
      GoalModel(
        id: '3',
        title: 'Cut-down calories',
        description: 'cook a low calorie recipe.',
        time: DateTime(2025, 6, 2, 11, 5),
        goalType: 'Diet',
        isDone: true,
        iconPath: 'assets/icons/meal_icon.png',
      ),
      GoalModel(
        id: '4',
        title: 'Submit assignment',
        description: 'Need to submit calculus assignment.',
        time: DateTime(2025, 9, 12, 12, 0),
        goalType: 'Education',
        isDone: true,
        iconPath: 'assets/icons/assignment_icon.png',
        date: DateTime(2025, 9, 12),
      ),
    ];
  }

  @override
  Future<List<GoalModel>> getGoals() async {
    return _goals;
  }

  @override
  Future<void> addGoal(GoalModel goal) async {
    // Check if this is a new goal without an ID
    if (goal.id.isEmpty) {
      // Create a new goal with a random ID
      final newGoal = GoalModel(
        id: Random().nextInt(1000000).toString(),
        title: goal.title,
        description: goal.description,
        time: goal.time,
        goalType: goal.goalType,
        date: goal.date,
        iconPath: _getIconPathForGoalType(goal.goalType),
        isDone: goal.isDone,
      );
      _goals.add(newGoal);
    } else {
      // Add the goal as is
      _goals.add(goal);
    }
  }

  @override
  Future<void> updateGoal(GoalModel goal) async {
    final index = _goals.indexWhere((g) => g.id == goal.id);
    if (index != -1) {
      _goals[index] = goal;
    }
  }

  @override
  Future<void> deleteGoal(String id) async {
    _goals.removeWhere((goal) => goal.id == id);
  }

  @override
  Future<void> toggleGoalStatus(String id) async {
    final index = _goals.indexWhere((goal) => goal.id == id);
    if (index != -1) {
      final goal = _goals[index];
      _goals[index] = GoalModel(
        id: goal.id,
        title: goal.title,
        description: goal.description,
        time: goal.time,
        goalType: goal.goalType,
        date: goal.date,
        iconPath: goal.iconPath,
        isDone: !goal.isDone,
      );
    }
  }

  // Helper method to get icon path based on goal type
  String _getIconPathForGoalType(String goalType) {
    return GoalColors.getIconPathForGoalType(goalType);
  }
}
