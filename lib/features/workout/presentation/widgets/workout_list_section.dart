import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/workout_constants.dart';
import '../viewmodels/workout_viewmodel.dart';
import 'workout_card.dart';

class WorkoutListSection extends StatelessWidget {
  const WorkoutListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 10),
        _buildWorkoutsList(context),
      ],
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          WorkoutConstants.yourWorkoutsTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutsList(BuildContext context) {
    final viewModel = Provider.of<WorkoutViewModel>(context);

    if (viewModel.isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (viewModel.error != null) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.error!),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed:
                    () => viewModel.fetchWorkoutsByType(
                      viewModel.selectedWorkoutType,
                    ),
                child: const Text(WorkoutConstants.tryAgainLabel),
              ),
            ],
          ),
        ),
      );
    }

    if (viewModel.workouts.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text(
            WorkoutConstants.noWorkoutsMessage,
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    // Now return a Column instead of ListView since we're already in a ScrollView
    return Column(
      children:
          viewModel.workouts.map((workout) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: WorkoutCard(workout: workout),
            );
          }).toList(),
    );
  }
}
