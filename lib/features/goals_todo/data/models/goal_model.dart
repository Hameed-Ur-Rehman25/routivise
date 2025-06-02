import '../../domain/entities/goal.dart';

class GoalModel extends Goal {
  GoalModel({
    required String id,
    required String title,
    required String description,
    required DateTime time,
    required String goalType,
    DateTime? date,
    String? iconPath,
    bool isDone = false,
  }) : super(
         id: id,
         title: title,
         description: description,
         time: time,
         goalType: goalType,
         date: date,
         iconPath: iconPath,
         isDone: isDone,
       );

  // Convert from Map (e.g., from a database or API)
  factory GoalModel.fromMap(Map<String, dynamic> map) {
    return GoalModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      time: DateTime.parse(map['time']),
      goalType: map['goalType'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      iconPath: map['iconPath'],
      isDone: map['isDone'] ?? false,
    );
  }

  // Convert to Map (e.g., for storing in a database or sending to an API)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time': time.toIso8601String(),
      'goalType': goalType,
      'date': date?.toIso8601String(),
      'iconPath': iconPath,
      'isDone': isDone,
    };
  }
}
