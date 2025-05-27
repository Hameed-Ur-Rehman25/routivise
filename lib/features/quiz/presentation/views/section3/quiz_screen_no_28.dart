import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_checkbox_tile.dart';

class QuizScreenNo28 extends StatelessWidget {
  final List<bool> selected;
  final Function(int) onChanged;

  const QuizScreenNo28({
    super.key, 
    required this.selected, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Morning routine',
      'Sleep schedule',
      'Exercise routine',
      'Time management',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'What habits do you want to improve?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Select all that apply',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomQuizCheckboxTile(
                text: options[index],
                checked: selected[index],
                onTap: () => onChanged(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
