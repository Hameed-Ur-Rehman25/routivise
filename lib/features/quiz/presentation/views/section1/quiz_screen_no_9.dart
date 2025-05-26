import 'package:flutter/material.dart';
import '../../widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo9 extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo9({super.key, this.selected = -1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'Do you want AI generated workout plans?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        CustomQuizRadioTile(
          text: 'Yes',
          checked: selected == 0,
          onTap: () => onChanged(0),
        ),
        CustomQuizRadioTile(
          text: 'No',
          checked: selected == 1,
          onTap: () => onChanged(1),
        ),
      ],
    );
  }
}
