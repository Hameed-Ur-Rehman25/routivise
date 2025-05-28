import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/gradient_scaffold.dart';
import 'package:routivise/features/quiz/presentation/views/quiz_screen_section3.dart';

class QuizSplashScreen03 extends StatefulWidget {
  const QuizSplashScreen03({super.key});

  @override
  State<QuizSplashScreen03> createState() => _QuizSplashScreen03State();
}

class _QuizSplashScreen03State extends State<QuizSplashScreen03> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const QuizScreenSection3()),
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
                'assets/images/Goals & Motivation.png',
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
                'assets/images/quiz_splash_screen3_logo.png',
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