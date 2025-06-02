import 'package:flutter/material.dart';

import '../../domain/entities/goal.dart';
import '../../domain/usecases/add_goal_usecase.dart';
import '../../domain/usecases/get_goals_usecase.dart';
import '../../domain/usecases/toggle_goal_status_usecase.dart';
import '../../domain/usecases/update_goal_usecase.dart';

class GoalViewModel extends ChangeNotifier {
  final GetGoalsUseCase _getGoalsUseCase;
  final AddGoalUseCase _addGoalUseCase;
  final UpdateGoalUseCase _updateGoalUseCase;
  final ToggleGoalStatusUseCase _toggleGoalStatusUseCase;

  GoalViewModel({
    required GetGoalsUseCase getGoalsUseCase,
    required AddGoalUseCase addGoalUseCase,
    required UpdateGoalUseCase updateGoalUseCase,
    required ToggleGoalStatusUseCase toggleGoalStatusUseCase,
  }) : _getGoalsUseCase = getGoalsUseCase,
       _addGoalUseCase = addGoalUseCase,
       _updateGoalUseCase = updateGoalUseCase,
       _toggleGoalStatusUseCase = toggleGoalStatusUseCase {
    fetchGoals();
  }

  // State variables
  List<Goal> _goals = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Goal> get goals => _goals;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch all goals
  Future<void> fetchGoals() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _goals = await _getGoalsUseCase.execute();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load goals: ${e.toString()}';
      notifyListeners();
    }
  }

  // Add a new goal
  Future<void> addGoal(Goal goal) async {
    try {
      await _addGoalUseCase.execute(goal);
      await fetchGoals(); // Refresh list after adding
    } catch (e) {
      _error = 'Failed to add goal: ${e.toString()}';
      notifyListeners();
    }
  }

  // Update an existing goal
  Future<void> updateGoal(Goal goal) async {
    try {
      await _updateGoalUseCase.execute(goal);
      await fetchGoals(); // Refresh list after updating
    } catch (e) {
      _error = 'Failed to update goal: ${e.toString()}';
      notifyListeners();
    }
  }

  // Toggle a goal's completion status
  Future<void> toggleGoalStatus(String id) async {
    try {
      await _toggleGoalStatusUseCase.execute(id);
      await fetchGoals(); // Refresh list after toggling
    } catch (e) {
      _error = 'Failed to update goal status: ${e.toString()}';
      notifyListeners();
    }
  }

  // Get goals by type
  List<Goal> getGoalsByType(String type) {
    return _goals.where((goal) => goal.goalType == type).toList();
  }

  // Clear error message
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
