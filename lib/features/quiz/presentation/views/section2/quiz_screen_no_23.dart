import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo23 extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo23({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final options = ['Yes', 'No'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'Do you travel for work frequently?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        ...options.asMap().entries.map((entry) => CustomQuizRadioTile(
          text: entry.value,
          checked: selected == entry.key,
          onTap: () => onChanged(entry.key),
        )),
      ],
    );
  }
}