import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/core/widgets/custom_bottom_nav_bar.dart';
import 'package:routivise/core/widgets/routine_card.dart';
import 'package:routivise/features/home/presentation/widgets/routivise_drawer.dart';

import '../../domain/entities/goal.dart';
import '../utils/goal_colors.dart';
import '../viewmodels/goal_viewmodel.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Refresh goals when entering the screen
    Future.microtask(() => context.read<GoalViewModel>().fetchGoals());
  }

  Color getColorForGoalType(String type) {
    return GoalColors.getColorForGoalType(type);
  }

  // Track current selected index for navigation
  int _selectedIndex = 1; // 1 is for Goals tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const RoutiviseDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Goals & To-do Lists',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildAddGoalButton(context),
              const SizedBox(height: 20),
              _buildGoalsHeader(context),
              const SizedBox(height: 10),
              _buildGoalsList(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _handleNavigation,
      ),
    );
  }

  Widget _buildAddGoalButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addGoal).then((_) {
            // Refresh goals list when returning from add goal screen
            context.read<GoalViewModel>().fetchGoals();
          });
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add new Goal',
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

  Widget _buildGoalsHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Goals',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            // Add filter functionality
          },
          icon: const Icon(Icons.filter_list, size: 18),
          label: const Text('Filter'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoalsList(BuildContext context) {
    final viewModel = context.watch<GoalViewModel>();

    if (viewModel.isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }

    if (viewModel.error != null) {
      return Expanded(
        child: Center(
          child: Text(
            viewModel.error!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    if (viewModel.goals.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'No goals added yet. Add your first goal!',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.goals.length,
        itemBuilder: (context, index) {
          final goal = viewModel.goals[index];
          return _buildGoalCard(goal, viewModel);
        },
      ),
    );
  }

  Widget _buildGoalCard(Goal goal, GoalViewModel viewModel) {
    // Format time
    String formatTime(DateTime time) {
      final hour = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      return '$hour:${minute} ${time.hour >= 12 ? 'pm' : 'am'}';
    }

    return RoutineCard(
      icon: goal.iconPath ?? 'assets/icons/assignment_icon.png',
      title: goal.title,
      time:
          goal.date != null
              ? '${goal.date!.day} ${_getMonthName(goal.date!.month)} ${goal.date!.year}'
              : formatTime(goal.time),
      description: goal.description,
      isDone: goal.isDone,
      leftcolor: getColorForGoalType(goal.goalType),
      accentColor: getColorForGoalType(goal.goalType),
      onTap: () {
        // Navigate to edit goal
      },
      onDonePressed: () {
        viewModel.toggleGoalStatus(goal.id);
      },
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sept',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  void _handleNavigation(int index) {
    if (index == _selectedIndex) {
      return;
    }

    if (index == 0) {
      // Navigate to Home
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (index == 1) {
      // Already on Goals screen
      setState(() => _selectedIndex = index);
    } else if (index == 2) {
      // Navigate to Exercise screen
      // TODO: Replace with actual route when Exercise screen is implemented
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Exercise screen coming soon')),
      );
    } else if (index == 3) {
      // Navigate to Food screen
      // TODO: Replace with actual route when Food screen is implemented
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Food screen coming soon')));
    } else if (index == 4) {
      // Open drawer
      _scaffoldKey.currentState?.openDrawer();
    }
  }
}
