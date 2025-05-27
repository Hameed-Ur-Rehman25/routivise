import 'package:flutter/material.dart';

class QuizScreenNo18 extends StatelessWidget {
  final TextEditingController controller;
  const QuizScreenNo18({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'How many hours per day do you spend in meetings?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'e.g. 3',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
              hintText: '',
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            ),
          ),
        ),
      ],
    );
  }
}
