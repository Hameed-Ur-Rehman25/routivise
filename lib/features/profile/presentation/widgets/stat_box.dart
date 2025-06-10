import 'package:flutter/material.dart';

/// A box that displays a statistic with a label and value
class StatBox extends StatelessWidget {
  /// The label for the statistic
  final String label;

  /// The value for the statistic
  final String value;

  /// Whether the value should be displayed in bold
  final bool isBold;

  const StatBox({
    required this.label,
    required this.value,
    this.isBold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
