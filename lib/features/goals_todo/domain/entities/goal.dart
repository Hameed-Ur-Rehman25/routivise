// Goal entity representing a user goal or todo item
class Goal {
  final String id;
  final String title;
  final String description;
  final DateTime time;
  final String goalType;
  final DateTime? date;
  final String? iconPath; // Path to the icon asset
  final bool isDone;

  Goal({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.goalType,
    this.date,
    this.iconPath,
    this.isDone = false,
  });

  // Create a copy of this goal with modified fields
  Goal copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? time,
    String? goalType,
    DateTime? date,
    String? iconPath,
    bool? isDone,
  }) {
    return Goal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      goalType: goalType ?? this.goalType,
      date: date ?? this.date,
      iconPath: iconPath ?? this.iconPath,
      isDone: isDone ?? this.isDone,
    );
  }
}
