import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'onboarding_content.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      onNext: () {
        Navigator.of(context).pushReplacementNamed('/onboarding/3');
      },
      onSkip: () {
        Navigator.of(context).pushReplacementNamed('/quiz');
      },
      child: const OnboardingContent(
        imagePath: 'assets/images/workout.png',
        textSpans: [
          TextSpan(
            text:
                'Use our Work Planner generate workout tailored to your needs!',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
