import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class GetWorkoutsByTypeUseCase {
  final WorkoutRepository _repository;

  GetWorkoutsByTypeUseCase(this._repository);

  Future<List<Workout>> execute(String workoutType) async {
    return await _repository.fetchWorkoutsByType(workoutType);
  }
}
