import 'package:flutter/material.dart';

class QuizScreenNo26 extends StatelessWidget {
  final TextEditingController controller;
  const QuizScreenNo26({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'What are your top 3 long-term personal goals?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        // Goal 1
        TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 18),
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
            hintText: '1.',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
        const SizedBox(height: 16),
        // Goal 2
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 18),
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
            hintText: '2.',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
        const SizedBox(height: 16),
        // Goal 3
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 18),
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
            hintText: '3.',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
        ),
      ],
    );
  }
}
