import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'onboarding_screen.dart';
import 'onboarding_content.dart';

class OnboardingScreen5 extends StatelessWidget {
  const OnboardingScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      onNext: () {
        Navigator.of(context).pushReplacementNamed('/quiz-splash');
      },
      onSkip: () {
        Navigator.of(context).pushReplacementNamed('/quiz-splash');
      },
      nextText: 'Take the Quiz',
      child: const OnboardingContent(
        imagePath: 'assets/images/notepad.png',
        textSpans: [
          TextSpan(
            text: 'Take a simple ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          TextSpan(
            text: 'quiz',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text:
                ' to help us identify your goals, aspirations  and weak spots to better help you ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          TextSpan(
            text: 'achieve',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: ' all your ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          TextSpan(
            text: 'objectives!',
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
