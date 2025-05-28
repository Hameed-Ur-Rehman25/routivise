// App root widget placeholder
import 'package:flutter/material.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/app/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme, // Ensures Poppins is the default font
      initialRoute: AppRoutes.onboardingSplash,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
