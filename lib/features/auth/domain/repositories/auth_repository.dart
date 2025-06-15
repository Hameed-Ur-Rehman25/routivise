import 'dart:async';
import '../models/user.dart';

/// Interface for authentication repository
///
/// This abstract class defines the contract for authentication operations
/// that should be implemented by any concrete repository class.
abstract class AuthRepository {
  /// Returns the current authenticated user, if any
  Future<User?> getCurrentUser();

  /// Signs in a user with email and password
  ///
  /// Returns the authenticated User on success
  Future<User> signInWithEmailPassword(String email, String password);

  /// Creates a new user account with email and password
  ///
  /// Returns the newly created User on success
  Future<User> signUpWithEmailPassword(
    String email,
    String password,
    String name,
  );

  /// Signs in a user with Google authentication
  ///
  /// Returns the authenticated User on success
  Future<User> signInWithGoogle();

  /// Signs out the current user
  Future<void> signOut();

  /// Gets a stream of the current authentication state
  ///
  /// The stream emits a User when signed in, or null when signed out
  Stream<User?> get authStateChanges;

  /// Returns true if a user is currently authenticated
  bool get isSignedIn;
}
