// filepath: /Users/pc/Desktop/routivise/lib/features/goals_todo/presentation/views/goals_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/goal_viewmodel.dart';
import '../widgets/add_goal_button.dart';
import '../widgets/goals_header.dart';
import '../widgets/goals_list.dart';
import '../constants/goal_constants.dart';

class GoalsScreen extends StatefulWidget {
  final bool showNavBar;

  const GoalsScreen({super.key, this.showNavBar = true});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  void initState() {
    super.initState();
    // Refresh goals when entering the screen
    Future.microtask(() => context.read<GoalViewModel>().fetchGoals());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GoalViewModel>(context, listen: false);

    // Content without scaffold - to be used in MainScreen
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    GoalConstants.goalsHeaderText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AddGoalButton(),
                  const SizedBox(height: 20),
                  GoalsHeader(viewModel: viewModel),
                  const SizedBox(height: 10),
                  const Expanded(child: GoalsList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
