import 'package:flutter/material.dart';
import 'package:routivise/core/widgets/routine_card.dart';

import '../../domain/entities/goal.dart';
import '../utils/goal_colors.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  final VoidCallback onToggleDone;
  final VoidCallback? onTap;

  const GoalCard({
    super.key,
    required this.goal,
    required this.onToggleDone,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _buildRoutineCard();
  }

  Widget _buildRoutineCard() {
    return RoutineCard(
      icon: goal.iconPath ?? 'assets/icons/assignment_icon.png',
      title: goal.title,
      time: _formatTimeDisplay(),
      description: goal.description,
      isDone: goal.isDone,
      leftcolor: GoalColors.getColorForGoalType(goal.goalType),
      accentColor: GoalColors.getColorForGoalType(goal.goalType),
      onTap: onTap,
      onDonePressed: onToggleDone,
    );
  }

  String _formatTimeDisplay() {
    if (goal.date != null) {
      return '${goal.date!.day} ${_getMonthName(goal.date!.month)} ${goal.date!.year}';
    } else {
      return _formatTime(goal.time);
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute ${time.hour >= 12 ? 'pm' : 'am'}';
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
}

// The RoutineCard is now correctly imported from the core widgets
