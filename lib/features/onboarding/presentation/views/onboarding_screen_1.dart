import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'onboarding_screen.dart';
import 'onboarding_content.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      onNext: () {
        Navigator.of(context).pushReplacementNamed('/onboarding/2');
      },
      onSkip: () {
        Navigator.of(context).pushReplacementNamed('/quiz-splash');
      },
      child: const OnboardingContent(
        imagePath: 'assets/images/Achieve.png',
        textSpans: [
          TextSpan(
            text: 'Achieve',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          TextSpan(
            text: ' all your goals and objectives with just a click!',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
