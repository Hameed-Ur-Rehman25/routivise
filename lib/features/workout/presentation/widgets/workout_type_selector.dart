import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/workout_constants.dart';
import '../viewmodels/workout_viewmodel.dart';
import 'workout_type_button.dart';

class WorkoutTypeSelector extends StatelessWidget {
  const WorkoutTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WorkoutViewModel>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTypeButton(
            context,
            WorkoutConstants.workoutTypeFocus,
            WorkoutConstants.focusIconPath,
            viewModel,
          ),
          const SizedBox(width: 12),
          _buildTypeButton(
            context,
            WorkoutConstants.workoutTypeQuick,
            WorkoutConstants.quickIconPath,
            viewModel,
          ),
          const SizedBox(width: 12),
          _buildTypeButton(
            context,
            WorkoutConstants.workoutTypeHIT,
            WorkoutConstants.hitIconPath,
            viewModel,
          ),
          const SizedBox(width: 12),
          _buildTypeButton(
            context,
            WorkoutConstants.workoutTypeCardio,
            WorkoutConstants.cardioIconPath,
            viewModel,
          ),
          const SizedBox(width: 12),
          _buildTypeButton(
            context,
            WorkoutConstants.workoutTypeMind,
            WorkoutConstants.mindIconPath,
            viewModel,
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(
    BuildContext context,
    String type,
    String iconPath,
    WorkoutViewModel viewModel,
  ) {
    final isSelected = viewModel.selectedWorkoutType == type;

    return WorkoutTypeButton(
      icon: Image.asset(
        iconPath,
        height: 24,
        color: isSelected ? Colors.white : Colors.black54,
      ),
      label: type,
      isSelected: isSelected,
      onTap: () => viewModel.fetchWorkoutsByType(type),
    );
  }
}
