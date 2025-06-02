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

  // State for filtered goals
  List<Goal> _allGoals = [];
  String? _activeFilter;

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
      _allGoals = await _getGoalsUseCase.execute();

      // Apply existing filter if there is one
      if (_activeFilter != null) {
        _applyFilter();
      } else {
        _goals = _allGoals;
      }

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

  // Filter goals by type
  void filterGoalsByType(String type) {
    _activeFilter = type;
    _applyFilter();
  }

  // Filter goals by date (today only)
  void filterGoalsByToday() {
    _activeFilter = 'today';
    _applyFilter();
  }

  // Sort goals by duration left
  void sortGoalsByDurationLeft() {
    _activeFilter = 'duration';
    _applyFilter();
  }

  // Clear all filters
  void clearFilter() {
    _activeFilter = null;
    _goals = _allGoals;
    notifyListeners();
  }

  // Apply the current active filter
  void _applyFilter() {
    if (_activeFilter == null) {
      _goals = _allGoals;
    } else if (_activeFilter == 'today') {
      // Filter goals for today
      final today = DateTime.now();
      _goals =
          _allGoals.where((goal) {
            if (goal.date != null) {
              return goal.date!.year == today.year &&
                  goal.date!.month == today.month &&
                  goal.date!.day == today.day;
            } else {
              return goal.time.year == today.year &&
                  goal.time.month == today.month &&
                  goal.time.day == today.day;
            }
          }).toList();
    } else if (_activeFilter == 'duration') {
      // Sort by time remaining
      final now = DateTime.now();
      _goals = List.from(_allGoals)..sort((a, b) {
        final aDuration = a.time.difference(now).inMinutes;
        final bDuration = b.time.difference(now).inMinutes;
        return aDuration.compareTo(bDuration);
      });
    } else {
      // Filter by goal type
      _goals =
          _allGoals
              .where(
                (goal) =>
                    goal.goalType.toLowerCase() == _activeFilter!.toLowerCase(),
              )
              .toList();
    }
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
