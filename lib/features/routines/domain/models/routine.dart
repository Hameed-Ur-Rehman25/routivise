class Routine {
  final String id;
  final String title;
  final String description;
  final String time;
  final bool isDone;
  final String icon;
  final String category;

  Routine({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    this.isDone = false,
    required this.icon,
    required this.category,
  });

  Routine copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    bool? isDone,
    String? icon,
    String? category,
  }) {
    return Routine(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      isDone: isDone ?? this.isDone,
      icon: icon ?? this.icon,
      category: category ?? this.category,
    );
  }
}
