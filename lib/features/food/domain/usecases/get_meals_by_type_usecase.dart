import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

class GetMealsByTypeUseCase {
  final MealRepository _mealRepository;

  GetMealsByTypeUseCase(this._mealRepository);

  Future<List<Meal>> execute(String mealType) async {
    return await _mealRepository.getMealsByType(mealType);
  }
}
