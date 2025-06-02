import 'dart:async';

import '../../domain/entities/goal.dart';
import '../../domain/repositories/goal_repository.dart';
import '../models/goal_model.dart';
import '../datasources/goal_datasource.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalDataSource dataSource;

  GoalRepositoryImpl(this.dataSource);

  @override
  Future<List<Goal>> getGoals() async {
    final goalModels = await dataSource.getGoals();
    return goalModels;
  }

  @override
  Future<void> addGoal(Goal goal) {
    return dataSource.addGoal(goal as GoalModel);
  }

  @override
  Future<void> updateGoal(Goal goal) {
    return dataSource.updateGoal(goal as GoalModel);
  }

  @override
  Future<void> deleteGoal(String id) {
    return dataSource.deleteGoal(id);
  }

  @override
  Future<void> toggleGoalStatus(String id) {
    return dataSource.toggleGoalStatus(id);
  }
}
