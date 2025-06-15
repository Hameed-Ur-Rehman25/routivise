import '../entities/user_entity.dart';

/// User model that extends UserEntity
///
/// This class is a data model that extends the core UserEntity
/// and can include additional methods or properties specific to
/// the data layer if needed.
class User extends UserEntity {
  User({
    required super.id,
    required super.name,
    required super.email,
    super.photoUrl,
  });

  @override
  User copyWith({String? id, String? name, String? email, String? photoUrl}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      if (photoUrl != null) 'photoUrl': photoUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }
}
