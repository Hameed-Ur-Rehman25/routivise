import '../entities/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> getMeals();
  Future<List<Meal>> getMealsByType(String mealType);
  Future<Meal> getMealById(String id);
}
