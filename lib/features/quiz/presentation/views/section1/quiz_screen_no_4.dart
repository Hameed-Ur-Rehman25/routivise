import 'package:flutter/material.dart';
import '../../widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo4 extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo4({super.key, this.selected = -1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'How many days a week do you exercise?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        CustomQuizRadioTile(
          text: '0-1 days',
          checked: selected == 0,
          onTap: () => onChanged(0),
        ),
        CustomQuizRadioTile(
          text: '2-3 days',
          checked: selected == 1,
          onTap: () => onChanged(1),
        ),
        CustomQuizRadioTile(
          text: '4-5 days',
          checked: selected == 2,
          onTap: () => onChanged(2),
        ),
        CustomQuizRadioTile(
          text: '6-7 days',
          checked: selected == 3,
          onTap: () => onChanged(3),
        ),
      ],
    );
  }
}
