import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/gradient_scaffold.dart';
import 'package:routivise/features/quiz/presentation/views/quiz_screen_section2.dart';

class QuizSplashScreen02 extends StatefulWidget {
  const QuizSplashScreen02({super.key});

  @override
  State<QuizSplashScreen02> createState() => _QuizSplashScreen02State();
}

class _QuizSplashScreen02State extends State<QuizSplashScreen02> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const QuizScreenSection2()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeIn,
              builder:
                  (context, value, child) =>
                      Opacity(opacity: value, child: child),
              child: Image.asset(
                'assets/images/Fitness & Nuitrition.png',
                width: 250,
                height: 210,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeIn,
              builder:
                  (context, value, child) =>
                      Opacity(opacity: value, child: child),
              child: Image.asset(
                'assets/images/quiz_splash_screen2_logo.png',
                width: 340,
                height: 340,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
