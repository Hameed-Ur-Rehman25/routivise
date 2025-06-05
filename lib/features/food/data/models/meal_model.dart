import 'package:routivise/features/food/domain/entities/meal.dart';

class MealModel extends Meal {
  MealModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.ingredients,
    required super.calories,
    required super.preparationTime,
    required super.tags,
    required super.mealType,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
      calories: json['calories'],
      preparationTime: json['preparationTime'],
      tags: List<String>.from(json['tags']),
      mealType: json['mealType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'calories': calories,
      'preparationTime': preparationTime,
      'tags': tags,
      'mealType': mealType,
    };
  }
}
