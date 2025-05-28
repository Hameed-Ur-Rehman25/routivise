class Mood {
  final String value;
  final DateTime timestamp;
  final String userId;
  final String? id;

  Mood({
    required this.value,
    required this.timestamp,
    required this.userId,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'timestamp': timestamp.toIso8601String(),
      'userId': userId,
      if (id != null) 'id': id,
    };
  }

  factory Mood.fromMap(Map<String, dynamic> map) {
    return Mood(
      value: map['value'],
      timestamp: DateTime.parse(map['timestamp']),
      userId: map['userId'],
      id: map['id'],
    );
  }

  Mood copyWith({
    String? value,
    DateTime? timestamp,
    String? userId,
    String? id,
  }) {
    return Mood(
      value: value ?? this.value,
      timestamp: timestamp ?? this.timestamp,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }
}
