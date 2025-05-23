import 'package:flutter/material.dart';
import 'package:routivise/features/home/presentation/views/home_screen.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_1.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_2.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_3.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_4.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_5.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_splash_screen.dart';
import '../features/splash/presentation/views/splash_screen.dart';
// Add imports for new screens as you implement them

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String onboardingSplash = '/onboarding/splash';
  static const String onboarding1 = '/onboarding/1';
  static const String onboarding2 = '/onboarding/2';
  static const String onboarding3 = '/onboarding/3';
  static const String onboarding4 = '/onboarding/4';
  static const String onboarding5 = '/onboarding/5';
  // Add more route names as needed

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case onboardingSplash:
        return MaterialPageRoute(
          builder: (_) => const OnboardingSplashScreen(),
        );
      case onboarding1:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen1());
      case onboarding2:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen2());
      case onboarding3:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen3());
      case onboarding4:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen4());
      case onboarding5:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen5());
      // Add more cases for new routes/screens
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text(
                    '404 | Page Not Found',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
        );
    }
  }
}
