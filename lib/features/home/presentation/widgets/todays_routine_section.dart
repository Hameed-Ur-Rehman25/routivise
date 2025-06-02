import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/widgets/routine_card.dart';
import 'package:routivise/features/routines/domain/providers/routine_provider.dart';

class TodaysRoutineSection extends StatelessWidget {
  const TodaysRoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today's Routine",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    final provider = Provider.of<RoutineProvider>(
                      context,
                      listen: false,
                    );
                    provider.refreshRoutines(
                      'user-123',
                    ); // Using temp userId for now
                  },
                  icon: Image.asset('assets/icons/refresh.png', height: 40),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Consumer<RoutineProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.routines.isEmpty) {
                  return const Center(child: Text('No routines for today'));
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: provider.routines.length,
                  itemBuilder: (context, index) {
                    final routine = provider.routines[index];
                    return _buildRoutineItem(
                      context,
                      icon: _getIconData(routine.icon),
                      title: routine.title,
                      time: routine.time,
                      description: routine.description,
                      isDone: routine.isDone,
                      routineId: routine.id,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'water_drop':
        return Icons.water_drop;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'restaurant':
        return Icons.restaurant;
      default:
        return Icons.check_circle_outline;
    }
  }

  Widget _buildRoutineItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String time,
    required String description,
    required bool isDone,
    required String routineId,
  }) {
    return RoutineCard(
      icon: icon,
      title: title,
      time: time,
      description: description,
      isDone: isDone,
      onTap: () {
        // TODO: Implement routine item tap action
      },
      onDonePressed: () {
        final provider = Provider.of<RoutineProvider>(context, listen: false);
        provider.toggleRoutineStatus(routineId);
      },
      accentColor: isDone ? AppColors.gradientStart : Colors.blue,
    );
  }
}
