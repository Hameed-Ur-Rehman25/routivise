import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/core/widgets/routine_card.dart';

import '../../domain/entities/goal.dart';
import '../utils/goal_colors.dart';
import '../viewmodels/goal_viewmodel.dart';

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

  Color getColorForGoalType(String type) {
    return GoalColors.getColorForGoalType(type);
  }

  @override
  Widget build(BuildContext context) {
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
        ],
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
        _buildFilterButton(),
      ],
    );
  }

  Widget _buildFilterButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextButton.icon(
        onPressed: _showFilterOptions,
        icon: Icon(Icons.filter_list, size: 18, color: Colors.indigo[400]),
        label: Text(
          'Filter',
          style: TextStyle(
            color: Colors.indigo[400],
            fontWeight: FontWeight.w500,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
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

  void _showFilterOptions() {
    String? selectedFilter;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildFilterOption(
                    'Duration Left (low to high)',
                    selectedFilter,
                    (value) {
                      setState(() => selectedFilter = value);
                    },
                  ),
                  _buildFilterOption('Today', selectedFilter, (value) {
                    setState(() => selectedFilter = value);
                  }),
                  _buildFilterOption('Exercise', selectedFilter, (value) {
                    setState(() => selectedFilter = value);
                  }),
                  _buildFilterOption('Meal', selectedFilter, (value) {
                    setState(() => selectedFilter = value);
                  }),
                  _buildFilterOption('To-do list', selectedFilter, (value) {
                    setState(() => selectedFilter = value);
                  }),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      if (selectedFilter != null) {
        _applyFilter(selectedFilter!);
      }
    });
  }

  Widget _buildFilterOption(
    String title,
    String? selectedFilter,
    Function(String) onSelected,
  ) {
    return InkWell(
      onTap: () {
        onSelected(title);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      selectedFilter == title
                          ? Colors.indigo
                          : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child:
                  selectedFilter == title
                      ? const Center(
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.indigo,
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    selectedFilter == title
                        ? FontWeight.w500
                        : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyFilter(String filterType) {
    final viewModel = context.read<GoalViewModel>();

    // Apply the appropriate filter based on selection
    switch (filterType) {
      case 'Duration Left (low to high)':
        // Sort goals by time remaining
        viewModel.sortGoalsByDurationLeft();
        break;
      case 'Today':
        // Filter goals for today
        viewModel.filterGoalsByToday();
        break;
      case 'Exercise':
        // Filter goals by Exercise type
        viewModel.filterGoalsByType('Exercise');
        break;
      case 'Meal':
        // Filter goals by Meal type
        viewModel.filterGoalsByType('Diet');
        break;
      case 'To-do list':
        // Filter all goals (reset filter)
        viewModel.clearFilter();
        break;
    }
  }
}
