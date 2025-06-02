import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

class HistoryItem extends StatelessWidget {
  final Widget iconWidget;
  final String value;
  final String timeRange;

  const HistoryItem({
    super.key,
    required this.iconWidget,
    required this.value,
    required this.timeRange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppStyles.cardDecoration,
      child: Row(
        children: [
          // Icon (emoji or water level)
          iconWidget,
          const SizedBox(width: 20),
          // Value (mood or energy percentage)
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Time range
          Text(
            timeRange,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
