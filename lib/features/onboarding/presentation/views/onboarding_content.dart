import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String imagePath;
  final List<InlineSpan> textSpans;

  const OnboardingContent({
    super.key,
    required this.imagePath,
    required this.textSpans,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 280, fit: BoxFit.contain),
        const SizedBox(height: 80),
        Text.rich(
          TextSpan(
            children: textSpans,
            style: const TextStyle(color: Colors.black),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
