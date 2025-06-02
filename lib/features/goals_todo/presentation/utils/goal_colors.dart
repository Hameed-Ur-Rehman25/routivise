import 'package:flutter/material.dart';

class GoalColors {
  static Color getColorForGoalType(String type) {
    switch (type.toLowerCase()) {
      case 'exercise':
        return Colors.orange;
      case 'health':
        return Colors.blue;
      case 'diet':
        return Colors.red;
      case 'education':
        return Colors.indigo;
      case 'work':
        return Colors.purple;
      default:
        return Colors.teal;
    }
  }

  static IconData getIconForGoalType(String type) {
    switch (type.toLowerCase()) {
      case 'exercise':
        return Icons.fitness_center;
      case 'diet':
        return Icons.restaurant;
      case 'health':
        return Icons.favorite;
      case 'education':
        return Icons.school;
      case 'work':
        return Icons.work;
      default:
        return Icons.check_circle;
    }
  }

  static String getIconPathForGoalType(String type) {
    switch (type.toLowerCase()) {
      case 'exercise':
        return 'assets/icons/dumbbell.svg';
      case 'health':
        return 'assets/icons/water_icon.png';
      case 'diet':
        return 'assets/icons/meal_icon.png';
      case 'education':
        return 'assets/icons/assignment_icon.png';
      case 'work':
        return 'assets/icons/Work-Life.svg';
      default:
        return 'assets/icons/mission.svg';
    }
  }
}
