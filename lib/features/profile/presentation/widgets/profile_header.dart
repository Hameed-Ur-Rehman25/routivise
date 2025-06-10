import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

import '../constants/profile_constants.dart';
import 'profile_stats_card.dart';

/// Header section for the profile screen with gradient background and stats
class ProfileHeader extends StatelessWidget {
  /// User's name to display
  final String userName;

  /// Number of completed workouts
  final String workoutsCount;

  /// Number of active days
  final String daysCount;

  /// Consistency percentage
  final String consistencyPercentage;

  /// Callback when back button is pressed
  final VoidCallback onBackPressed;

  const ProfileHeader({
    required this.userName,
    required this.workoutsCount,
    required this.daysCount,
    required this.consistencyPercentage,
    required this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeaderNavigation(),
            const SizedBox(height: 8),
            Text(
              userName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ProfileStatsCard(
              workoutsCount: workoutsCount,
              daysCount: daysCount,
              consistencyPercentage: consistencyPercentage,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderNavigation() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: onBackPressed,
        ),
        const SizedBox(width: 4),
        const Text(
          ProfileConstants.profileTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
