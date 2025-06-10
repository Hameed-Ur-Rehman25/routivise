class WorkoutProgress {
  final String workoutId;
  final String workoutName;
  final String imageUrl;
  final int totalDuration;
  final int elapsedDuration;
  final DateTime lastAccessed;

  WorkoutProgress({
    required this.workoutId,
    required this.workoutName,
    required this.imageUrl,
    required this.totalDuration,
    required this.elapsedDuration,
    required this.lastAccessed,
  });

  double get completionPercentage =>
      totalDuration > 0 ? (elapsedDuration / totalDuration) : 0;

  String get formattedCompletionPercentage =>
      '${(completionPercentage * 100).toInt()}% Complete';
}
