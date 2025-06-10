import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/goal_constants.dart';
import '../viewmodels/goal_viewmodel.dart';
import 'goal_card.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GoalViewModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(
        child: Text(
          viewModel.error!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (viewModel.goals.isEmpty) {
      return const Center(
        child: Text(
          GoalConstants.noGoalsMessage,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: viewModel.goals.length,
      itemBuilder: (context, index) {
        final goal = viewModel.goals[index];
        return GoalCard(
          goal: goal,
          onToggleDone: () => viewModel.toggleGoalStatus(goal.id),
          onTap: () {
            // Navigate to edit goal - Implement this later
          },
        );
      },
    );
  }
}
