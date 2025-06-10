import 'package:routivise/features/workout/domain/entities/workout.dart';
import 'package:routivise/features/workout/domain/repositories/workout_repository.dart';
import '../../data/datasources/workout_datasource.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutDataSource _dataSource;

  WorkoutRepositoryImpl(this._dataSource);

  @override
  Future<List<Workout>> fetchWorkouts() async {
    return await _dataSource.getWorkouts();
  }

  @override
  Future<List<Workout>> fetchWorkoutsByType(String workoutType) async {
    return await _dataSource.getWorkoutsByType(workoutType);
  }

  @override
  Future<Workout> getWorkoutById(String id) async {
    return await _dataSource.getWorkoutById(id);
  }
}
