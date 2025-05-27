import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo32 extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;

  const QuizScreenNo32({
    super.key, 
    required this.selected, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Yes, I want my routine to adapt to my mood',
      'Sometimes, but I prefer consistency',
      'No, I prefer a consistent routine',
      'I\'m not sure',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'Would you like your routine to adjust based on how you feel?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomQuizRadioTile(
                text: options[index],
                checked: selected == index,
                onTap: () => onChanged(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
