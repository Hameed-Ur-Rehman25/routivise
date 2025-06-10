import 'package:provider/provider.dart';
import '../viewmodels/workout_viewmodel.dart';
import '../../data/datasources/local_workout_datasource.dart';
import '../../data/datasources/workout_datasource.dart';
import '../../data/repositories/workout_repository_impl.dart';
import '../../domain/repositories/workout_repository.dart';
import '../../domain/usecases/get_workouts_usecase.dart';
import '../../domain/usecases/get_workouts_by_type_usecase.dart';
import '../../domain/usecases/get_workout_by_id_usecase.dart';

class WorkoutDependencyInjector {
  // Provide the main ViewModel through ChangeNotifierProvider
  static ChangeNotifierProvider<WorkoutViewModel> getProvider() {
    // Create the data source
    final WorkoutDataSource dataSource = LocalWorkoutDataSource();

    // Create the repository implementation
    final WorkoutRepository repository = WorkoutRepositoryImpl(dataSource);

    // Create the use cases
    final getWorkoutsUseCase = GetWorkoutsUseCase(repository);
    final getWorkoutsByTypeUseCase = GetWorkoutsByTypeUseCase(repository);
    final getWorkoutByIdUseCase = GetWorkoutByIdUseCase(repository);

    // Create and provide the view model with the use cases
    return ChangeNotifierProvider(
      create:
          (_) => WorkoutViewModel(
            getWorkoutsUseCase: getWorkoutsUseCase,
            getWorkoutsByTypeUseCase: getWorkoutsByTypeUseCase,
            getWorkoutByIdUseCase: getWorkoutByIdUseCase,
          ),
    );
  }
}
