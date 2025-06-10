/// Constants used across the goals feature
class GoalConstants {
  // Filter options
  static const List<String> filterOptions = [
    'Duration Left (low to high)',
    'Today',
    'Exercise',
    'Meal',
    'To-do list',
  ];

  // Filter keys for internal use
  static const String filterDuration = 'Duration Left (low to high)';
  static const String filterToday = 'Today';
  static const String filterExercise = 'Exercise';
  static const String filterMeal = 'Meal';
  static const String filterTodoList = 'To-do list';

  // Goal types that map to filter options
  static const String goalTypeExercise = 'Exercise';
  static const String goalTypeDiet = 'Diet';

  // UI strings
  static const String noGoalsMessage =
      'No goals added yet. Add your first goal!';
  static const String addGoalButtonText = 'Add new Goal';
  static const String goalsHeaderText = 'Goals & To-do Lists';
  static const String yourGoalsText = 'Your Goals';
  static const String filterButtonText = 'Filter';
}
