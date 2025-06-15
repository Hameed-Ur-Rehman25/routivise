import '../models/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for getting the current authenticated user
class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  /// Execute the use case to get the current user
  Future<User?> execute() async {
    return await repository.getCurrentUser();
  }
}
