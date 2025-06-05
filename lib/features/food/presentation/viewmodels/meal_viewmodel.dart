import 'package:flutter/material.dart';

import '../../domain/entities/meal.dart';
import '../../domain/usecases/get_meal_by_id_usecase.dart';
import '../../domain/usecases/get_meals_usecase.dart';
import '../../domain/usecases/get_meals_by_type_usecase.dart';

class MealViewModel extends ChangeNotifier {
  final GetMealsUseCase _getMealsUseCase;
  final GetMealsByTypeUseCase _getMealsByTypeUseCase;
  final GetMealByIdUseCase _getMealByIdUseCase;

  MealViewModel({
    required GetMealsUseCase getMealsUseCase,
    required GetMealsByTypeUseCase getMealsByTypeUseCase,
    required GetMealByIdUseCase getMealByIdUseCase,
  }) : _getMealsUseCase = getMealsUseCase,
       _getMealsByTypeUseCase = getMealsByTypeUseCase,
       _getMealByIdUseCase = getMealByIdUseCase {
    // Initialize with all meals
    fetchMeals();
  }

  // State variables
  List<Meal> _meals = [];
  List<Meal> _filteredMeals = [];
  bool _isLoading = false;
  String? _error;
  String _selectedMealType = 'breakfast'; // Default selected meal type
  final List<String> _mealTypes = [
    'breakfast',
    'lunch',
    'dinner',
    'snacks',
    'drinks',
  ];

  // Getters
  List<Meal> get meals => _filteredMeals.isEmpty ? _meals : _filteredMeals;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedMealType => _selectedMealType;
  List<String> get mealTypes => _mealTypes;

  // Fetch all meals
  Future<void> fetchMeals() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _meals = await _getMealsUseCase.execute();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load meals: ${e.toString()}';
      notifyListeners();
    }
  }

  // Fetch meals by type
  Future<void> fetchMealsByType(String mealType) async {
    _isLoading = true;
    _error = null;
    _selectedMealType = mealType;
    notifyListeners();

    try {
      _filteredMeals = await _getMealsByTypeUseCase.execute(mealType);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load meals: ${e.toString()}';
      notifyListeners();
    }
  }

  // Fetch meal by id
  Future<Meal> fetchMealById(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final meal = await _getMealByIdUseCase.execute(id);
      _isLoading = false;
      notifyListeners();
      return meal;
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load meal: ${e.toString()}';
      notifyListeners();
      rethrow; // Rethrow to allow handling in UI
    }
  }

  // Filter meals by tags
  void filterMealsByTag(String tag) {
    _filteredMeals = _meals.where((meal) => meal.tags.contains(tag)).toList();
    notifyListeners();
  }

  // Clear filters
  void clearFilters() {
    _filteredMeals = [];
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
