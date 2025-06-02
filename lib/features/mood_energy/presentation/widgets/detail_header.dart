import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

class DetailHeader extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget statusWidget;

  const DetailHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.statusWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: [
          // Back button and title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 5),
                Text(title, style: AppStyles.headerMedium),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Icon (emoji, water level, etc.)
          icon,
          const SizedBox(height: 10),
          // Status (mood value or energy percentage)
          statusWidget,
        ],
      ),
    );
  }
}
