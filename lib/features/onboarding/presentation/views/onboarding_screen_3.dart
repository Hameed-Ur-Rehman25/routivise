import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

import 'onboarding_content.dart';
import 'onboarding_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      onNext: () {
        Navigator.of(context).pushReplacementNamed('/onboarding/4');
      },
      onSkip: () {
        Navigator.of(context).pushReplacementNamed('/quiz-splash');
      },
      child: const OnboardingContent(
        imagePath: 'assets/images/emojies.png',
        textSpans: [
          TextSpan(
            text: 'Log your ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          TextSpan(
            text: 'moods and energy levels',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: ' to helps us create your ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          TextSpan(
            text: 'perfect AI routine!',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
