import '../entities/goal.dart';
import '../repositories/goal_repository.dart';

class UpdateGoalUseCase {
  final GoalRepository repository;

  UpdateGoalUseCase(this.repository);

  Future<void> execute(Goal goal) {
    return repository.updateGoal(goal);
  }
}
