import 'package:flutter/material.dart';

import '../../domain/entities/workout_progress.dart';
import '../constants/workout_constants.dart';

class ContinueWatchingCard extends StatelessWidget {
  final WorkoutProgress progress;
  final VoidCallback onTap;
  final double width;

  const ContinueWatchingCard({
    super.key,
    required this.progress,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Column(children: [_buildCardHeader(), _buildCardFooter()]),
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Stack(
      children: [
        // Background image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.asset(
            progress.imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image fails to load
              return Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.fitness_center,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),

        // Progress bar at the bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 5,
            child: LinearProgressIndicator(
              value: progress.completionPercentage,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(WorkoutConstants.primaryColorValue),
              ),
            ),
          ),
        ),

        // Continue button
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow, size: 16, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  WorkoutConstants.continueLabel,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardFooter() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              progress.workoutName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            progress.formattedCompletionPercentage,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
