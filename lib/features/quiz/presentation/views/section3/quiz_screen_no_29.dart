import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo29 extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;

  const QuizScreenNo29({
    super.key, 
    required this.selected, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Energetic and motivated',
      'Tired and sluggish',
      'Neutral - neither energetic nor tired',
      'It varies day to day',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'How do you usually feel in the morning?',
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
