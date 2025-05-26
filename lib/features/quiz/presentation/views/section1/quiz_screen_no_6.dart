import 'package:flutter/material.dart';
import '../../widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo6 extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo6({super.key, this.selected = -1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        const Text(
          'What is your current\nfitness Level?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        CustomQuizRadioTile(
          text: 'Sedentary',
          checked: selected == 0,
          onTap: () => onChanged(0),
        ),
        CustomQuizRadioTile(
          text: 'Lightly active',
          checked: selected == 1,
          onTap: () => onChanged(1),
        ),
        CustomQuizRadioTile(
          text: 'Active',
          checked: selected == 2,
          onTap: () => onChanged(2),
        ),
        CustomQuizRadioTile(
          text: 'Very active',
          checked: selected == 3,
          onTap: () => onChanged(3),
        ),
      ],
    );
  }
}
