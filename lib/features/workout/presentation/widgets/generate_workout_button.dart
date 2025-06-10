import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/workout_constants.dart';
import '../viewmodels/workout_viewmodel.dart';

class GenerateWorkoutButton extends StatelessWidget {
  const GenerateWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () => _generateWorkout(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(WorkoutConstants.primaryColorValue),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        icon: const Icon(Icons.refresh, color: Colors.white),
        label: const Text(
          WorkoutConstants.generateButtonLabel,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _generateWorkout(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(WorkoutConstants.generatingMessage)),
    );
    context.read<WorkoutViewModel>().fetchWorkouts();
  }
}
