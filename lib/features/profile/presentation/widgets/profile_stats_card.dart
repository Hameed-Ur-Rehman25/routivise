import 'package:flutter/material.dart';

import '../constants/profile_constants.dart';
import 'stat_box.dart';

/// A card displaying user's profile statistics in a row
class ProfileStatsCard extends StatelessWidget {
  /// Number of completed workouts
  final String workoutsCount;

  /// Number of active days
  final String daysCount;

  /// Consistency percentage
  final String consistencyPercentage;

  const ProfileStatsCard({
    required this.workoutsCount,
    required this.daysCount,
    required this.consistencyPercentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Workouts stat
          StatBox(label: ProfileConstants.workoutsLabel, value: workoutsCount),
          const VerticalDivider(
            color: Color(0xFFDFE3E6),
            thickness: 1,
            width: 24,
            indent: 8,
            endIndent: 8,
          ),
          // Days stat
          StatBox(label: ProfileConstants.daysLabel, value: daysCount),
          const VerticalDivider(
            color: Color(0xFFDFE3E6),
            thickness: 1,
            width: 24,
            indent: 8,
            endIndent: 8,
          ),
          // Consistency stat
          StatBox(
            label: ProfileConstants.consistencyLabel,
            value: consistencyPercentage,
          ),
        ],
      ),
    );
  }
}
