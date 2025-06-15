import 'package:flutter/foundation.dart';
import '../../domain/models/user.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/sign_in_with_email_password_usecase.dart';
import '../../domain/usecases/sign_in_with_google_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_with_email_password_usecase.dart';

/// Provider to manage authentication state
///
/// This class is responsible for providing authentication state
/// to the UI and executing authentication use cases.
class AuthProvider extends ChangeNotifier {
  // Use cases
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignInWithEmailPasswordUseCase _signInWithEmailPasswordUseCase;
  final SignUpWithEmailPasswordUseCase _signUpWithEmailPasswordUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUseCase _signOutUseCase;

  // State
  User? _user;
  bool _isLoading = false;
  String? _error;

  // Getters
  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  String? get error => _error;

  /// Constructor that takes all required use cases
  AuthProvider({
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase,
    required SignUpWithEmailPasswordUseCase signUpWithEmailPasswordUseCase,
    required SignInWithGoogleUseCase signInWithGoogleUseCase,
    required SignOutUseCase signOutUseCase,
  }) : _getCurrentUserUseCase = getCurrentUserUseCase,
       _signInWithEmailPasswordUseCase = signInWithEmailPasswordUseCase,
       _signUpWithEmailPasswordUseCase = signUpWithEmailPasswordUseCase,
       _signInWithGoogleUseCase = signInWithGoogleUseCase,
       _signOutUseCase = signOutUseCase {
    _init();
  }

  /// Initialize the provider by checking for a current user
  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _getCurrentUserUseCase.execute();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Sign in with email and password
  Future<bool> signInWithEmailPassword(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _signInWithEmailPasswordUseCase.execute(email, password);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Sign up with email and password
  Future<bool> signUpWithEmailPassword(
    String email,
    String password,
    String name,
  ) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _signUpWithEmailPasswordUseCase.execute(
        email,
        password,
        name,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Sign out the current user
  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    await _signOutUseCase.execute();
    _user = null;

    _isLoading = false;
    notifyListeners();
  }

  /// Sign in with Google authentication
  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _signInWithGoogleUseCase.execute();
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
