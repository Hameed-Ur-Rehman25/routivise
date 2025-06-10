class Workout {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> exercises;
  final int calories;
  final int duration; // in minutes
  final List<String> tags; // e.g. "Advanced", "High Intensity", etc.
  final String workoutType; // e.g. "Focus", "Quick", "Mind", "HIT", etc.

  Workout({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.exercises,
    required this.calories,
    required this.duration,
    required this.tags,
    required this.workoutType,
  });
}
