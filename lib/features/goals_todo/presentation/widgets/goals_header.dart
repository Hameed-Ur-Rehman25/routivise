import 'package:flutter/material.dart';
import '../constants/goal_constants.dart';
import '../viewmodels/goal_viewmodel.dart';
import 'goal_filter_bottom_sheet.dart';

class GoalsHeader extends StatelessWidget {
  final GoalViewModel viewModel;

  const GoalsHeader({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          GoalConstants.yourGoalsText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        _buildFilterButton(context),
      ],
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _showFilterOptions(context),
      icon: const Icon(Icons.tune, size: 18),
      label: const Text(GoalConstants.filterButtonText),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Future<void> _showFilterOptions(BuildContext context) async {
    final selectedFilter = await GoalFilterBottomSheet.show(
      context,
      initialSelectedFilter: null, // You might want to track the current filter
    );

    if (selectedFilter != null) {
      _applyFilter(selectedFilter);
    }
  }

  void _applyFilter(String filterType) {
    switch (filterType) {
      case GoalConstants.filterDuration:
        viewModel.sortGoalsByDurationLeft();
        break;
      case GoalConstants.filterToday:
        viewModel.filterGoalsByToday();
        break;
      case GoalConstants.filterExercise:
        viewModel.filterGoalsByType(GoalConstants.goalTypeExercise);
        break;
      case GoalConstants.filterMeal:
        viewModel.filterGoalsByType(GoalConstants.goalTypeDiet);
        break;
      case GoalConstants.filterTodoList:
        viewModel.clearFilter();
        break;
    }
  }
}
