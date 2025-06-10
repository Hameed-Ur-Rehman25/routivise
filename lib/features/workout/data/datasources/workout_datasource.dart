import '../../domain/entities/workout.dart';

abstract class WorkoutDataSource {
  Future<List<Workout>> getWorkouts();
  Future<List<Workout>> getWorkoutsByType(String workoutType);
  Future<Workout> getWorkoutById(String id);
}
