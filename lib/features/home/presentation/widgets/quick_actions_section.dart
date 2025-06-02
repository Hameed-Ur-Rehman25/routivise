import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/app/theme.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickActionButton(
                    iconPath: 'assets/icons/dumbbell.svg',
                    label: 'New Workout\nPlan',
                    iconColor: Color(0xFFFF9A0C),
                    onPressed: () {
                      // TODO: Implement New Workout Plan navigation
                    },
                  ),
                  _buildQuickActionButton(
                    iconPath: 'assets/icons/fork-and-spoon.svg',
                    iconColor: Color(0xFFFD4545),

                    label: 'Meal\nPlanning',
                    onPressed: () {
                      // TODO: Implement Meal Planning navigation
                    },
                  ),
                  _buildQuickActionButton(
                    isIconData: true,
                    iconData: Icons.add,
                    iconColor: Color(0xFF5850BE),
                    label: 'Custom\nPlan',
                    onPressed: () {
                      // TODO: Implement Custom Plan navigation
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton({
    String? iconPath,
    IconData? iconData,
    bool isIconData = false,
    required String label,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    final color = iconColor ?? AppColors.gradientStart;
    return SizedBox(
      width: 100,
      height: 95,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isIconData
                ? Icon(iconData, size: 40, color: color)
                : SvgPicture.asset(
                  iconPath!,
                  height: 35,
                  width: 30,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
