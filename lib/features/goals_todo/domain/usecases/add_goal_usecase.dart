import '../entities/goal.dart';
import '../repositories/goal_repository.dart';

class AddGoalUseCase {
  final GoalRepository repository;

  AddGoalUseCase(this.repository);

  Future<void> execute(Goal goal) {
    return repository.addGoal(goal);
  }
}
