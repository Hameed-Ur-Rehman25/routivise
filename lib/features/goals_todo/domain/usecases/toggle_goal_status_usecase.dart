import '../repositories/goal_repository.dart';

class ToggleGoalStatusUseCase {
  final GoalRepository repository;

  ToggleGoalStatusUseCase(this.repository);

  Future<void> execute(String id) {
    return repository.toggleGoalStatus(id);
  }
}
