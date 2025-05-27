import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo31 extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;

  const QuizScreenNo31({
    super.key, 
    required this.selected, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Yes, daily',
      'Yes, but not consistently',
      'I\'ve tried but haven\'t stuck with it',
      'No, I never have',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'Do you currently track your mood?',
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
