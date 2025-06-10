import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class GetWorkoutsUseCase {
  final WorkoutRepository _repository;

  GetWorkoutsUseCase(this._repository);

  Future<List<Workout>> execute() async {
    return await _repository.fetchWorkouts();
  }
}
