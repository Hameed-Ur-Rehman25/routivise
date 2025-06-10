import 'package:flutter/material.dart';
import 'package:routivise/core/screens/main_screen.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_1.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_2.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_3.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_4.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_screen_5.dart';
import 'package:routivise/features/onboarding/presentation/views/onboarding_splash_screen.dart';
import 'package:routivise/features/quiz/presentation/views/section1/quiz_splash_screen.dart';
import 'package:routivise/features/quiz/presentation/views/quiz_completed_screen.dart';
import 'package:routivise/features/auth/presentation/views/login_screen.dart';
import 'package:routivise/features/auth/presentation/views/signup_screen.dart';
import 'package:routivise/features/mood_energy/presentation/views/mood_detail_screen.dart';
import 'package:routivise/features/mood_energy/presentation/views/energy_detail_screen.dart';
import 'package:routivise/features/profile/presentation/views/profile_screen.dart';
import 'package:routivise/features/profile/presentation/views/info_screen.dart';
import 'package:routivise/features/workout/presentation/views/workout_detail_screen.dart';
import '../features/splash/presentation/views/splash_screen.dart';
import 'package:routivise/features/subscription/presentation/views/subscribe_screen.dart';
import 'package:routivise/features/goals_todo/presentation/views/add_goal_screen.dart';
import 'package:routivise/features/food/presentation/views/meal_detail_screen.dart';
// Add imports for new screens as you implement them

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String onboardingSplash = '/onboarding/splash';
  static const String onboarding1 = '/onboarding/1';
  static const String onboarding2 = '/onboarding/2';
  static const String onboarding3 = '/onboarding/3';
  static const String onboarding4 = '/onboarding/4';
  static const String onboarding5 = '/onboarding/5';
  static const String quizSplash = '/quiz-splash';
  static const String quizCompleted = '/quiz-completed';
  static const String moodDetail = '/mood-detail';
  static const String energyDetail = '/energy-detail';
  static const String profile = '/profile';
  static const String info = '/info';
  static const String subscribe = '/subscribe';
  static const String goals = '/goals';
  static const String addGoal = '/goals/add';
  static const String food = '/food';
  static const String mealDetail = '/food/meal-detail';
  static const String workout = '/workout';
  static const String workoutDetail = '/workout/detail';
  // Add more route names as needed

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(initialTabIndex: 0),
        );
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
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
      case quizSplash:
        return MaterialPageRoute(builder: (_) => const QuizSplashScreen());
      case quizCompleted:
        return MaterialPageRoute(builder: (_) => const QuizCompletedScreen());
      case moodDetail:
        return MaterialPageRoute(builder: (_) => const MoodDetailScreen());
      case energyDetail:
        return MaterialPageRoute(builder: (_) => const EnergyDetailScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case info:
        return MaterialPageRoute(builder: (_) => const InfoScreen());
      case subscribe:
        return MaterialPageRoute(builder: (_) => const SubscribeScreen());
      case goals:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(initialTabIndex: 1),
        );
      case addGoal:
        return MaterialPageRoute(builder: (_) => const AddGoalScreen());
      case food:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(initialTabIndex: 3),
        );
      case mealDetail:
        final mealId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => MealDetailScreen(mealId: mealId),
        );
      case workout:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(initialTabIndex: 2),
        );
      case workoutDetail:
        final workoutId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => WorkoutDetailScreen(workoutId: workoutId),
        );
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
