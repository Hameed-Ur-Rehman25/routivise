import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/home/presentation/widgets/mood_energy_row.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325, // Reduced height
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildDateAndNotification(),

              _buildGreeting(),
              const SizedBox(height: 10),
              const MoodEnergyRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateAndNotification() {
    return Row(
      children: [
        Text(
          DateTimeHelper.getCurrentTime(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          padding: const EdgeInsets.all(1.0),
          onPressed: () {
            //TODO: Implement notification functionality
          },
          icon: const Icon(Icons.notifications, color: Colors.white, size: 25),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return const Text('Good Morning!', style: AppStyles.headerLarge);
  }
}
