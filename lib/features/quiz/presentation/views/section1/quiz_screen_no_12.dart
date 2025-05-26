import 'package:flutter/material.dart';
import '../../widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo12 extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo12({
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
          'How Many Meals\ndo you eat per day?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        CustomQuizRadioTile(
          text: '1',
          checked: selected == 0,
          onTap: () => onChanged(0),
        ),
        CustomQuizRadioTile(
          text: '2',
          checked: selected == 1,
          onTap: () => onChanged(1),
        ),
        CustomQuizRadioTile(
          text: '3',
          checked: selected == 2,
          onTap: () => onChanged(2),
        ),
        CustomQuizRadioTile(
          text: 'more than 3',
          checked: selected == 3,
          onTap: () => onChanged(3),
        ),
      ],
    );
  }
}
