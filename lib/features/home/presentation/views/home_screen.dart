import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/features/routines/domain/providers/routine_provider.dart';
import 'package:routivise/core/widgets/custom_bottom_nav_bar.dart';
import 'package:routivise/features/home/presentation/widgets/routivise_drawer.dart';
import 'package:routivise/features/home/presentation/widgets/header_section.dart';
import 'package:routivise/features/home/presentation/widgets/quick_actions_section.dart';
import 'package:routivise/features/home/presentation/widgets/todays_routine_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: _scaffoldKey,
      drawer: const RoutiviseDrawer(),
      body: Stack(
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
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _handleNavigation,
      ),
    );
  }

  void _handleNavigation(int index) {
    if (index == 4) {
      _scaffoldKey.currentState?.openDrawer();
    } else if (index == 1) {
      // Navigate to Goals screen when goals tab is clicked
      Navigator.pushReplacementNamed(context, AppRoutes.goals);
    } else {
      setState(() => _selectedIndex = index);
    }
  }
}
