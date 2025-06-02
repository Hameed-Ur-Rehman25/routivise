import '../entities/goal.dart';

abstract class GoalRepository {
  /// Get all goals
  Future<List<Goal>> getGoals();

  /// Add a new goal
  Future<void> addGoal(Goal goal);

  /// Update an existing goal
  Future<void> updateGoal(Goal goal);

  /// Delete a goal
  Future<void> deleteGoal(String id);

  /// Mark a goal as done/undone
  Future<void> toggleGoalStatus(String id);
}
