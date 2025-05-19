import 'package:flutter/material.dart';

class OnboardingScreen5 extends StatelessWidget {
  const OnboardingScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Onboarding Screen 5',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
