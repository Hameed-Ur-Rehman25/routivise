import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo30 extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;

  const QuizScreenNo30({
    super.key, 
    required this.selected, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Yes, please create one for me',
      'No, I prefer to create my own',
      'I already have a morning routine',
      'I\'m not interested in a morning routine',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'Would you like a morning routine built for you?',
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
