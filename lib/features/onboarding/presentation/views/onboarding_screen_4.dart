import 'package:flutter/material.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Onboarding Screen 4',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
