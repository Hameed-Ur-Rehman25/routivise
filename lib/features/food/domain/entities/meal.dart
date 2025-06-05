class Meal {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final int calories;
  final int preparationTime; // in minutes
  final List<String> tags; // e.g. "Low carb", "Vegetarian", etc.
  final String mealType; // e.g. "breakfast", "lunch", "dinner", "snacks"

  Meal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.calories,
    required this.preparationTime,
    required this.tags,
    required this.mealType,
  });
}
