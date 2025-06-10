import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(String) onSelected;

  const FilterOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelected(title);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFFEC534A)
                          : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? const Center(
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Color(0xFFEC534A),
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
