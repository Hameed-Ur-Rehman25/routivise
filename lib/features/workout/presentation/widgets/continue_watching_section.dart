import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/workout_constants.dart';
import '../viewmodels/workout_viewmodel.dart';
import '../views/workout_detail_screen.dart';
import 'continue_watching_card.dart';

class ContinueWatchingSection extends StatelessWidget {
  const ContinueWatchingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WorkoutViewModel>(context);
    final recentWorkouts = viewModel.recentWorkouts;

    if (recentWorkouts.isEmpty) {
      return const SizedBox.shrink(); // Hide if no recent workouts
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          WorkoutConstants.continueWatchingTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentWorkouts.length,
            itemBuilder: (context, index) {
              final progress = recentWorkouts[index];
              return ContinueWatchingCard(
                progress: progress,
                width: MediaQuery.of(context).size.width - 32,
                onTap:
                    () => _navigateToWorkout(
                      context,
                      progress.workoutId,
                      viewModel,
                    ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _navigateToWorkout(
    BuildContext context,
    String workoutId,
    WorkoutViewModel viewModel,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(WorkoutConstants.continuingMessage)),
    );

    final workout = await viewModel.getWorkoutById(workoutId);
    if (workout != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutDetailScreen(workoutId: workoutId),
        ),
      );
    }
  }
}
