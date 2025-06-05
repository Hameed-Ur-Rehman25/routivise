import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

class GetMealByIdUseCase {
  final MealRepository _mealRepository;

  GetMealByIdUseCase(this._mealRepository);

  Future<Meal> execute(String id) async {
    return await _mealRepository.getMealById(id);
  }
}
