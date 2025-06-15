import '../models/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing in with email and password
class SignInWithEmailPasswordUseCase {
  final AuthRepository repository;

  SignInWithEmailPasswordUseCase(this.repository);

  /// Execute the use case to sign in
  ///
  /// Returns the authenticated User on success
  Future<User> execute(String email, String password) async {
    return await repository.signInWithEmailPassword(email, password);
  }
}
