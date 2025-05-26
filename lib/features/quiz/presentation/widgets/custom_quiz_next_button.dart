import 'package:flutter/material.dart';

class CustomQuizNextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomQuizNextButton({super.key, this.onPressed, this.text = 'Next'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF2196F3), // blue text
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), // pill shape
            ),
            elevation: 0,
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF2196F3), // blue text
            ),
          ),
        ),
      ),
    );
  }
}
