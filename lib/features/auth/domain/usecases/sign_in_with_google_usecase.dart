import '../models/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing in with Google authentication
class SignInWithGoogleUseCase {
  final AuthRepository repository;

  SignInWithGoogleUseCase(this.repository);

  /// Execute the use case to sign in with Google
  ///
  /// Returns the authenticated User on success
  Future<User> execute() async {
    return await repository.signInWithGoogle();
  }
}
