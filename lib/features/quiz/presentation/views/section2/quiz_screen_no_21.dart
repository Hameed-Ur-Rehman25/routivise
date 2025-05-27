import 'package:flutter/material.dart';
import 'package:routivise/features/quiz/presentation/widgets/custom_quiz_checkbox_tile.dart';

class QuizScreenNo21 extends StatelessWidget {
  final List<bool> selected;
  final ValueChanged<int> onChanged;
  const QuizScreenNo21({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final options = ['Morning', 'Afternoon', 'Evening', 'Night', 'Before sleep'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Text(
          'Are there specific times of the day you feel most productive?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        ...options.asMap().entries.map((entry) => CustomQuizCheckboxTile(
          text: entry.value,
          checked: selected[entry.key],
          onTap: () => onChanged(entry.key),
        )),
      ],
    );
  }
}
