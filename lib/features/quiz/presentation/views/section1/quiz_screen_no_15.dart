import 'package:flutter/material.dart';
import '../../widgets/custom_quiz_radio_tile.dart';

class QuizScreenNo15 extends StatelessWidget {
  final List<bool> selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo15({
    super.key,
    required this.selected,
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
          'What time do you prefer to workout?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        CustomQuizRadioTile(
          text: 'Morning',
          checked: selected[0],
          onTap: () => onChanged(0),
        ),
        CustomQuizRadioTile(
          text: 'Afternoon',
          checked: selected[1],
          onTap: () => onChanged(1),
        ),
        CustomQuizRadioTile(
          text: 'Evening',
          checked: selected[2],
          onTap: () => onChanged(2),
        ),
        CustomQuizRadioTile(
          text: 'Night',
          checked: selected[3],
          onTap: () => onChanged(3),
        ),
        CustomQuizRadioTile(
          text: 'Before sleep',
          checked: selected[4],
          onTap: () => onChanged(4),
        ),
      ],
    );
  }
}
