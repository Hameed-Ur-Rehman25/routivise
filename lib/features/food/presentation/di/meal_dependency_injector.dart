import 'package:provider/provider.dart';

import '../../data/datasources/local_meal_datasource.dart';
import '../../data/datasources/meal_datasource.dart';
import '../../data/repositories/meal_repository_impl.dart';
import '../../domain/repositories/meal_repository.dart';
import '../../domain/usecases/get_meals_usecase.dart';
import '../../domain/usecases/get_meals_by_type_usecase.dart';
import '../../domain/usecases/get_meal_by_id_usecase.dart';
import '../viewmodels/meal_viewmodel.dart';

class MealDependencyInjector {
  // Provide the main ViewModel through ChangeNotifierProvider
  static ChangeNotifierProvider<MealViewModel> getProvider() {
    return ChangeNotifierProvider(
      create:
          (_) => MealViewModel(
            getMealsUseCase: _provideGetMealsUseCase(),
            getMealsByTypeUseCase: _provideGetMealsByTypeUseCase(),
            getMealByIdUseCase: _provideGetMealByIdUseCase(),
          ),
    );
  }

  // Usecases
  static GetMealsUseCase _provideGetMealsUseCase() {
    return GetMealsUseCase(_provideMealRepository());
  }

  static GetMealsByTypeUseCase _provideGetMealsByTypeUseCase() {
    return GetMealsByTypeUseCase(_provideMealRepository());
  }

  static GetMealByIdUseCase _provideGetMealByIdUseCase() {
    return GetMealByIdUseCase(_provideMealRepository());
  }

  // Repository
  static MealRepository _provideMealRepository() {
    return MealRepositoryImpl(_provideMealDataSource());
  }

  // DataSource
  static MealDataSource _provideMealDataSource() {
    return LocalMealDataSource();
  }
}
