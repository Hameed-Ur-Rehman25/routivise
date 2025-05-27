import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo33 extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;

  const QuizScreenNo33({
    super.key, 
    required this.selected, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Productive and accomplishing goals',
      'Relaxed and stress-free',
      'Balanced between work and leisure',
      'Energetic and active',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'What would a perfect day look like for you?',
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
