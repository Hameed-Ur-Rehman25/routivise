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
    return OutlinedButton.icon(
      onPressed: _showFilterOptions,
      icon: const Icon(Icons.tune, size: 18),
      label: const Text('Filter'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
      return '$hour:$minute ${time.hour >= 12 ? 'pm' : 'am'}';
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
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filter By',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 24),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildFilterOption(
                          'Duration Left (low to high)',
                          selectedFilter,
                          (value) {
                            setState(() => selectedFilter = value);
                          },
                        ),
                        const Divider(height: 1),
                        _buildFilterOption('Today', selectedFilter, (value) {
                          setState(() => selectedFilter = value);
                        }),
                        const Divider(height: 1),
                        _buildFilterOption('Exercise', selectedFilter, (value) {
                          setState(() => selectedFilter = value);
                        }),
                        const Divider(height: 1),
                        _buildFilterOption('Meal', selectedFilter, (value) {
                          setState(() => selectedFilter = value);
                        }),
                        const Divider(height: 1),
                        _buildFilterOption('To-do list', selectedFilter, (
                          value,
                        ) {
                          setState(() => selectedFilter = value);
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() => selectedFilter = null);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            if (selectedFilter != null) {
                              _applyFilter(selectedFilter!);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEC534A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
    final bool isSelected = selectedFilter == title;
    return InkWell(
      onTap: () {
        onSelected(title);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFFEC534A)
                          : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? const Center(
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Color(0xFFEC534A),
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.black87,
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
