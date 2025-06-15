import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/sign_in_with_email_password_usecase.dart';
import '../../domain/usecases/sign_in_with_google_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_with_email_password_usecase.dart';

/// Dependency injector for authentication feature
///
/// This class is responsible for creating and providing all dependencies
/// required by the authentication feature.
class AuthDependencyInjector {
  /// Get the ChangeNotifierProvider for auth feature
  static ChangeNotifierProvider<AuthProvider> getProvider() {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) {
        // Create repository
        final AuthRepository repository = AuthRepositoryImpl();

        // Create use cases
        final getCurrentUserUseCase = GetCurrentUserUseCase(repository);
        final signInWithEmailPasswordUseCase = SignInWithEmailPasswordUseCase(
          repository,
        );
        final signUpWithEmailPasswordUseCase = SignUpWithEmailPasswordUseCase(
          repository,
        );
        final signInWithGoogleUseCase = SignInWithGoogleUseCase(repository);
        final signOutUseCase = SignOutUseCase(repository);

        // Create provider with all dependencies
        return AuthProvider(
          getCurrentUserUseCase: getCurrentUserUseCase,
          signInWithEmailPasswordUseCase: signInWithEmailPasswordUseCase,
          signUpWithEmailPasswordUseCase: signUpWithEmailPasswordUseCase,
          signInWithGoogleUseCase: signInWithGoogleUseCase,
          signOutUseCase: signOutUseCase,
        );
      },
    );
  }
}
