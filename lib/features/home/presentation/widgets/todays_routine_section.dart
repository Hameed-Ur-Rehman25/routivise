import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/widgets/routine_card.dart';

class TodaysRoutineSection extends StatelessWidget {
  const TodaysRoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Static data for testing routines with icons and accent colors
    final routinesData = [
      {
        'icon': 'assets/icons/assignment_icon.png',
        'title': 'Study',
        'time': '8:00 AM',
        'description': 'Complete assignment',
        'leftColor': AppColors.gradientStart,
        'isDone': true,
      },
      {
        'icon': 'assets/icons/meal_icon.png',
        'title': 'Breakfast',
        'time': '9:30 AM',
        'description': 'Healthy meal',
        'leftColor': AppColors.secondary,
        'isDone': true,
      },
      {
        'icon': 'assets/icons/workout_icon.png',
        'title': 'Workout',
        'time': '6:00 PM',
        'description': 'Gym session',
        'leftColor': Colors.red,
        'isDone': true,
      },
      {
        'icon': 'assets/icons/water_icon.png',
        'title': 'Hydrate',
        'time': '11:00 AM',
        'description': 'Drink water',
        'leftColor': Colors.blue,
        'isDone': true,
      },
    ];
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
                    // For static data, we could add an animation here
                    // Later this will refresh data from RoutineProvider
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Refreshing routines...'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: Image.asset('assets/icons/refresh.png', height: 40),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: routinesData.length,
              itemBuilder: (context, index) {
                final routine = routinesData[index];
                return RoutineCard(
                  icon: routine['icon'] as String,
                  title: routine['title'] as String,
                  time: routine['time'] as String,
                  description: routine['description'] as String,
                  isDone: routine['isDone'] as bool,
                  onTap: () {},
                  onDonePressed: () {},
                  leftcolor: routine['leftColor'] as Color,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
