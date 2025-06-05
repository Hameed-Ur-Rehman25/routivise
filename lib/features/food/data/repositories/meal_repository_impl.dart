import '../../domain/entities/meal.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/meal_datasource.dart';

class MealRepositoryImpl implements MealRepository {
  final MealDataSource _dataSource;

  MealRepositoryImpl(this._dataSource);

  @override
  Future<List<Meal>> getMeals() async {
    return await _dataSource.getMeals();
  }

  @override
  Future<List<Meal>> getMealsByType(String mealType) async {
    return await _dataSource.getMealsByType(mealType);
  }

  @override
  Future<Meal> getMealById(String id) async {
    return await _dataSource.getMealById(id);
  }
}
