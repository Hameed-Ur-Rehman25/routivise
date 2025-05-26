import 'package:flutter/material.dart';
import '../../widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo13 extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo13({
    super.key,
    this.selected = -1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'How many days of the week do you want to workout?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        CustomQuizRadioTile(
          text: '1-2',
          checked: selected == 0,
          onTap: () => onChanged(0),
        ),
        CustomQuizRadioTile(
          text: '3-4',
          checked: selected == 1,
          onTap: () => onChanged(1),
        ),
        CustomQuizRadioTile(
          text: '5-6',
          checked: selected == 2,
          onTap: () => onChanged(2),
        ),
        CustomQuizRadioTile(
          text: 'whole week',
          checked: selected == 3,
          onTap: () => onChanged(3),
        ),
      ],
    );
  }
}
