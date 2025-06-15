import '../models/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing up with email and password
class SignUpWithEmailPasswordUseCase {
  final AuthRepository repository;

  SignUpWithEmailPasswordUseCase(this.repository);

  /// Execute the use case to sign up
  ///
  /// Returns the newly created User on success
  Future<User> execute(String email, String password, String name) async {
    return await repository.signUpWithEmailPassword(email, password, name);
  }
}
