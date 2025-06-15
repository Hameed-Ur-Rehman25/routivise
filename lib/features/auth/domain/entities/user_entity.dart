/// User entity representing an authenticated user
///
/// This class is the core domain entity for user data
class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  /// Constructor for UserEntity
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  /// Create a copy of this UserEntity with some properties changed
  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  /// Convert UserEntity to a Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'photoUrl': photoUrl};
  }

  /// Create UserEntity from a Map
  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String?,
    );
  }
}
