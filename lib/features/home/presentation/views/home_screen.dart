import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/features/routines/domain/providers/routine_provider.dart';
import 'package:routivise/features/home/presentation/widgets/header_section.dart';
import 'package:routivise/features/home/presentation/widgets/quick_actions_section.dart';
import 'package:routivise/features/home/presentation/widgets/todays_routine_section.dart';

class HomeScreen extends StatefulWidget {
  final bool showNavBar;

  const HomeScreen({super.key, this.showNavBar = true});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initializeProviders();
  }

  void _initializeProviders() {
    // Use a temporary user ID until authentication is implemented
    const String userId = 'user-123';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final moodProvider = Provider.of<MoodProvider>(context, listen: false);
      final energyProvider = Provider.of<EnergyProvider>(
        context,
        listen: false,
      );
      final routineProvider = Provider.of<RoutineProvider>(
        context,
        listen: false,
      );

      moodProvider.fetchCurrentMood(userId);
      energyProvider.fetchCurrentEnergy(userId);
      routineProvider.fetchTodaysRoutines(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // For HomeScreen, we just return the content without scaffold
    // as it will be wrapped in the MainScreen when used there
    return Stack(
      children: [
        Column(
          children: const [
            HeaderSection(),
            Expanded(child: TodaysRoutineSection()),
          ],
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: QuickActionsSection(),
        ),
      ],
    );
  }
}
