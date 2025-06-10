// filepath: /Users/pc/Desktop/routivise/lib/features/workout/presentation/views/workout_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/workout_constants.dart';
import '../viewmodels/workout_viewmodel.dart';
import '../widgets/continue_watching_section.dart';
import '../widgets/generate_workout_button.dart';
import '../widgets/workout_list_section.dart';
import '../widgets/workout_type_selector.dart';

class WorkoutScreen extends StatefulWidget {
  final bool showNavBar;

  const WorkoutScreen({super.key, this.showNavBar = true});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize with Focus workout type
    Future.microtask(
      () => context.read<WorkoutViewModel>().fetchWorkoutsByType(
        WorkoutConstants.workoutTypeFocus,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  WorkoutConstants.workoutPlannerTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                const WorkoutTypeSelector(),
                const SizedBox(height: 20),
                const GenerateWorkoutButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Now the remaining content is in a single scrollable area
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContinueWatchingSection(),
                    const SizedBox(height: 20),
                    const WorkoutListSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
