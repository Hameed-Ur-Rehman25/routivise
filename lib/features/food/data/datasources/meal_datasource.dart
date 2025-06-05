import '../models/meal_model.dart';

abstract class MealDataSource {
  Future<List<MealModel>> getMeals();
  Future<List<MealModel>> getMealsByType(String mealType);
  Future<MealModel> getMealById(String id);
}
