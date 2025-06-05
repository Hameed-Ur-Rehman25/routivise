import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

class GetMealsUseCase {
  final MealRepository _mealRepository;

  GetMealsUseCase(this._mealRepository);

  Future<List<Meal>> execute() async {
    return await _mealRepository.getMeals();
  }
}
