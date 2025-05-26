import 'package:flutter/material.dart';

class QuizScreenNo3 extends StatelessWidget {
  const QuizScreenNo3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'What is your height\n(cm)?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 180,
          child: TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              hintText: '',
            ),
          ),
        ),
      ],
    );
  }
}
