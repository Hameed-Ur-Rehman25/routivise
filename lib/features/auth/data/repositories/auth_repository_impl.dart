import 'dart:async';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../services/auth_service.dart';

/// Implementation of the AuthRepository interface
///
/// This class is responsible for implementing the authentication
/// operations defined in the AuthRepository interface.
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  /// Constructor that takes an AuthService dependency
  AuthRepositoryImpl({AuthService? authService})
    : _authService = authService ?? AuthService();

  @override
  Future<User?> getCurrentUser() async {
    return await _authService.getCurrentUser();
  }

  @override
  Future<User> signInWithEmailPassword(String email, String password) async {
    return await _authService.signInWithEmailPassword(email, password);
  }

  @override
  Future<User> signUpWithEmailPassword(
    String email,
    String password,
    String name,
  ) async {
    return await _authService.signUpWithEmailPassword(email, password, name);
  }

  @override
  Future<User> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  @override
  Stream<User?> get authStateChanges => _authService.userStream;

  @override
  bool get isSignedIn => _authService.isSignedIn;
}
