import '../repositories/auth_repository.dart';

/// Use case for signing out the current user
class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  /// Execute the use case to sign out
  Future<void> execute() async {
    await repository.signOut();
  }
}
