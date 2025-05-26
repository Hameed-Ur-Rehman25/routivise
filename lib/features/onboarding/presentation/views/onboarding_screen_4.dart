import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

import 'onboarding_content.dart';
import 'onboarding_screen.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      onNext: () {
        Navigator.of(context).pushReplacementNamed('/onboarding/5');
      },
      onSkip: () {
        Navigator.of(context).pushReplacementNamed('/quiz-splash');
      },
      child: const OnboardingContent(
        imagePath: 'assets/images/food.png',
        textSpans: [
          TextSpan(
            text: 'Follow mouth-watering and nutritious ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          TextSpan(
            text: 'meals plans',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: ' to keep your gut healthy and thriving!',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
