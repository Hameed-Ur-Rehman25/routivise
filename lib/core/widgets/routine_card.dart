import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

class RoutineCard extends StatelessWidget {
  final dynamic icon; // Can be String (asset path) or IconData
  final String title;
  final String time;
  final String description;
  final bool isDone;
  final VoidCallback? onTap;
  final VoidCallback? onDonePressed;
  final Color? accentColor;
  final Color? leftcolor;

  const RoutineCard({
    super.key,
    required this.icon, // Updated type
    required this.title,
    required this.time,
    required this.description,
    this.isDone = false,
    this.onTap,
    this.onDonePressed,
    this.accentColor,
    this.leftcolor,
  });

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? AppColors.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            // Left colored section with accent border
            Container(
              width: 20,
              decoration: BoxDecoration(
                color: leftcolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: leftcolor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        // Icon with background
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:
                              icon is IconData
                                  ? Icon(icon, color: color, size: 20)
                                  : Image.asset(icon, width: 20, height: 20),
                        ),
                        const SizedBox(width: 12),
                        // Title and time
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                time,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    // Done button
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: onDonePressed,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(85, 30),
                          backgroundColor: isDone ? color : Colors.grey[200],
                          foregroundColor:
                              isDone ? Colors.white : Colors.grey[600],
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(isDone ? 'Done!' : 'Todo'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
