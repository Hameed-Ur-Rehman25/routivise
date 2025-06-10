import '../entities/workout.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> fetchWorkouts();
  Future<List<Workout>> fetchWorkoutsByType(String workoutType);
  Future<Workout> getWorkoutById(String id);
}
