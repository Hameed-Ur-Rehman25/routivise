import '../entities/goal.dart';
import '../repositories/goal_repository.dart';

class GetGoalsUseCase {
  final GoalRepository repository;

  GetGoalsUseCase(this.repository);

  Future<List<Goal>> execute() {
    return repository.getGoals();
  }
}
