import 'dart:async';
import 'package:routivise/features/auth/domain/models/user.dart';

/// A service to handle user authentication and session management
///
/// This class provides authentication functionality and maintains
/// the current authentication state.
class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  AuthService._internal();

  // Current user stream
  final StreamController<User?> _userController =
      StreamController<User?>.broadcast();

  /// Stream of the current authenticated user (null when signed out)
  Stream<User?> get userStream => _userController.stream;

  // Current auth state
  User? _currentUser;
  User? get currentUser => _currentUser;

  /// Returns true if a user is currently signed in
  bool get isSignedIn => _currentUser != null;

  /// For now, this method provides a mock user for development
  ///
  /// Returns the current authenticated User or null if not authenticated
  Future<User?> getCurrentUser() async {
    // In a real app, you would check the saved auth state
    // For now, just return a mock user if already set
    if (_currentUser != null) {
      return _currentUser;
    }

    return null;
  }

  /// Sign in with email and password
  Future<User> signInWithEmailPassword(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would authenticate with a backend service
    // For now, create a mock user
    _currentUser = User(id: 'user-123', name: 'Test User', email: email);

    _userController.add(_currentUser);
    return _currentUser!;
  }

  /// Sign up with email and password
  Future<User> signUpWithEmailPassword(
    String email,
    String password,
    String name,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would register with a backend service
    // For now, create a mock user
    _currentUser = User(id: 'user-123', name: name, email: email);

    _userController.add(_currentUser);
    return _currentUser!;
  }

  /// Sign in with Google
  Future<User> signInWithGoogle() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would authenticate with Google OAuth
    // For now, create a mock Google user
    _currentUser = User(
      id: 'google-user-123',
      name: 'Google User',
      email: 'google@example.com',
      photoUrl: 'https://example.com/profile.jpg',
    );

    _userController.add(_currentUser);
    return _currentUser!;
  }

  /// Sign out the current user
  Future<void> signOut() async {
    // In a real app, you would sign out from the backend service
    _currentUser = null;
    _userController.add(null);
  }

  /// Clean up resources
  void dispose() {
    _userController.close();
  }
}
