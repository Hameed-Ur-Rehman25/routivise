import '../models/meal_model.dart';
import 'meal_datasource.dart';

class LocalMealDataSource implements MealDataSource {
  // Mock data for demo purposes
  final List<MealModel> _meals = [
    MealModel(
      id: '1',
      name: 'Feta Cheese Salad',
      imageUrl: 'assets/images/food.png',
      ingredients: [
        'Feta Cheese',
        'Lettuce',
        'Tomatoes',
        'Red Onion',
        'Olives',
      ],
      calories: 521,
      preparationTime: 15,
      tags: ['Low carb', 'Vegetarian'],
      mealType: 'lunch',
    ),
    MealModel(
      id: '2',
      name: 'Greek Yogurt with Berries',
      imageUrl: 'assets/images/food.png',
      ingredients: ['Greek Yogurt', 'Mixed Berries', 'Honey', 'Granola'],
      calories: 320,
      preparationTime: 5,
      tags: ['Low carb', 'Vegetarian'],
      mealType: 'breakfast',
    ),
    MealModel(
      id: '3',
      name: 'Vegetable Stir Fry',
      imageUrl: 'assets/images/food.png',
      ingredients: ['Broccoli', 'Bell Peppers', 'Carrots', 'Soy Sauce', 'Rice'],
      calories: 410,
      preparationTime: 20,
      tags: ['Vegetarian', 'High protein'],
      mealType: 'dinner',
    ),
    MealModel(
      id: '4',
      name: 'Mixed Nuts',
      imageUrl: 'assets/images/food.png',
      ingredients: ['Almonds', 'Walnuts', 'Cashews', 'Pistachios'],
      calories: 270,
      preparationTime: 1,
      tags: ['Low carb', 'High protein'],
      mealType: 'snacks',
    ),
    MealModel(
      id: '5',
      name: 'Green Smoothie',
      imageUrl: 'assets/images/food.png',
      ingredients: ['Spinach', 'Banana', 'Almond Milk', 'Chia Seeds'],
      calories: 190,
      preparationTime: 5,
      tags: ['Low calorie', 'Vegetarian'],
      mealType: 'drinks',
    ),
    MealModel(
      id: '6',
      name: 'Avocado Toast',
      imageUrl: 'assets/images/food.png',
      ingredients: [
        'Whole Grain Bread',
        'Avocado',
        'Salt',
        'Pepper',
        'Lemon Juice',
      ],
      calories: 310,
      preparationTime: 10,
      tags: ['Vegetarian', 'High protein'],
      mealType: 'breakfast',
    ),
  ];

  @override
  Future<List<MealModel>> getMeals() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _meals;
  }

  @override
  Future<List<MealModel>> getMealsByType(String mealType) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _meals.where((meal) => meal.mealType == mealType).toList();
  }

  @override
  Future<MealModel> getMealById(String id) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    final meal = _meals.firstWhere(
      (meal) => meal.id == id,
      orElse: () => throw Exception('Meal not found'),
    );
    return meal;
  }
}
