import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

class GetWorkoutByIdUseCase {
  final WorkoutRepository _repository;

  GetWorkoutByIdUseCase(this._repository);

  Future<Workout> execute(String id) async {
    return await _repository.getWorkoutById(id);
  }
}
