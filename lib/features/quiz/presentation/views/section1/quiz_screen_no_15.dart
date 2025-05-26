import 'package:flutter/material.dart';

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
        CheckboxListTile(
          value: selected[0],
          onChanged: (_) => onChanged(0),
          title: const Text('Morning'),
        ),
        CheckboxListTile(
          value: selected[1],
          onChanged: (_) => onChanged(1),
          title: const Text('Afternoon'),
        ),
        CheckboxListTile(
          value: selected[2],
          onChanged: (_) => onChanged(2),
          title: const Text('Evening'),
        ),
        CheckboxListTile(
          value: selected[3],
          onChanged: (_) => onChanged(3),
          title: const Text('Night'),
        ),
        CheckboxListTile(
          value: selected[4],
          onChanged: (_) => onChanged(4),
          title: const Text('Before sleep'),
        ),
      ],
    );
  }
}
