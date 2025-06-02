import '../models/goal_model.dart';

abstract class GoalDataSource {
  /// Get all goals
  Future<List<GoalModel>> getGoals();

  /// Add a new goal
  Future<void> addGoal(GoalModel goal);

  /// Update an existing goal
  Future<void> updateGoal(GoalModel goal);

  /// Delete a goal
  Future<void> deleteGoal(String id);

  /// Mark a goal as done/undone
  Future<void> toggleGoalStatus(String id);
}
