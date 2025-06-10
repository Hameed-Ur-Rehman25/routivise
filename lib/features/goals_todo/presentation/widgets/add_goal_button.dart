import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import '../constants/goal_constants.dart';
import '../viewmodels/goal_viewmodel.dart';

class AddGoalButton extends StatelessWidget {
  const AddGoalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => _navigateToAddGoal(context),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          GoalConstants.addGoalButtonText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  void _navigateToAddGoal(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addGoal).then((_) {
      // Refresh goals list when returning from add goal screen
      context.read<GoalViewModel>().fetchGoals();
    });
  }
}
