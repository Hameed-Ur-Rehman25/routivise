import 'package:flutter/material.dart';

class QuizScreenNo11 extends StatelessWidget {
  final TextEditingController controller;
  const QuizScreenNo11({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'Do you have any dietary\npreferences or restrictions?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'e.g. vegan, keto, allergies',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
