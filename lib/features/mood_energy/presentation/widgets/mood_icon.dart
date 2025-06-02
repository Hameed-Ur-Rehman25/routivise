import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  final String type;
  final double size;

  const MoodIcon({super.key, required this.type, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color:
            type == 'angry'
                ? Colors.red.shade400
                : type == 'neutral'
                ? Colors.amber.shade400
                : Colors.green.shade400,
        shape: BoxShape.circle,
      ),
      child: Icon(
        type == 'angry'
            ? Icons.sentiment_very_dissatisfied
            : type == 'neutral'
            ? Icons.sentiment_neutral
            : Icons.sentiment_very_satisfied,
        color: Colors.white,
        size: size * 0.7,
      ),
    );
  }
}
