import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/gradient_scaffold.dart';

import '../quiz_screen.dart';

class QuizSplashScreen extends StatefulWidget {
  const QuizSplashScreen({super.key});

  @override
  State<QuizSplashScreen> createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const QuizScreen()),
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
                'assets/images/Work & Life.png',
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
                'assets/images/quiz_splash_screen_logo.png',
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
