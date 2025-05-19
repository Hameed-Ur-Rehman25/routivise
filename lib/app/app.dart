// App root widget placeholder
import 'package:flutter/material.dart';
import 'package:routivise/app/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.onboardingSplash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
