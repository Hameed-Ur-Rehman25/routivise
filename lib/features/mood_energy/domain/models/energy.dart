class Energy {
  final int percentage;
  final DateTime timestamp;
  final String userId;
  final String? id;

  Energy({
    required this.percentage,
    required this.timestamp,
    required this.userId,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'percentage': percentage,
      'timestamp': timestamp.toIso8601String(),
      'userId': userId,
      if (id != null) 'id': id,
    };
  }

  factory Energy.fromMap(Map<String, dynamic> map) {
    return Energy(
      percentage: map['percentage'],
      timestamp: DateTime.parse(map['timestamp']),
      userId: map['userId'],
      id: map['id'],
    );
  }

  Energy copyWith({
    int? percentage,
    DateTime? timestamp,
    String? userId,
    String? id,
  }) {
    return Energy(
      percentage: percentage ?? this.percentage,
      timestamp: timestamp ?? this.timestamp,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }
}
