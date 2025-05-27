import 'package:flutter/material.dart';

class CustomQuizCheckboxTile extends StatelessWidget {
  final String text;
  final bool checked;
  final VoidCallback? onTap;

  const CustomQuizCheckboxTile({
    super.key,
    required this.text,
    required this.checked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              checked
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: checked ? const Color(0xFF2196F3) : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
