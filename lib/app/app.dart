// App root widget placeholder
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/features/auth/presentation/providers/auth_provider.dart';
import 'package:routivise/features/goals_todo/presentation/di/goal_dependency_injector.dart';
import 'package:routivise/features/food/presentation/di/meal_dependency_injector.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/features/routines/domain/providers/routine_provider.dart';
import 'package:routivise/features/workout/presentation/di/workout_dependency_injector.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MoodProvider()),
        ChangeNotifierProvider(create: (_) => EnergyProvider()),
        ChangeNotifierProvider(create: (_) => RoutineProvider()),
        GoalDependencyInjector.getProvider(),
        MealDependencyInjector.getProvider(),
        WorkoutDependencyInjector.getProvider(),
      ],
      child: MaterialApp(
        theme: appTheme, // Ensures Poppins is the default font
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
