import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/features/home/presentation/widgets/status_container.dart';
import 'package:routivise/core/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initialize providers when home screen is loaded
    final moodProvider = Provider.of<MoodProvider>(context, listen: false);
    final energyProvider = Provider.of<EnergyProvider>(context, listen: false);

    // Use a temporary user ID until you implement authentication
    const String userId = 'user-123';

    // Fetch current mood and energy data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moodProvider.fetchCurrentMood(userId);
      energyProvider.fetchCurrentEnergy(userId);
    });

    return Scaffold(
      body: Column(children: [_buildHeaderSection()]),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // TODO: Add navigation logic for each tab if needed
        },
      ),
    );
  }

  // Header section with gradient background
  Widget _buildHeaderSection() {
    return Container(
      height: 310,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateAndNotification(),
              _buildGreeting(),
              const SizedBox(height: 5),
              _buildMoodAndEnergyRow(),
            ],
          ),
        ),
      ),
    );
  }

  // Date and notification row
  Widget _buildDateAndNotification() {
    final currentDateTime = DateTimeHelper.getCurrentTime();
    return Row(
      children: [
        Text(
          currentDateTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(
          padding: const EdgeInsets.all(1.0),
          onPressed: () {
            //TODO: Implement notification functionality
          },
          icon: const Icon(Icons.notifications, color: Colors.white, size: 25),
        ),
      ],
    );
  }

  // Greeting text
  Widget _buildGreeting() {
    return const Text('Good Morning!', style: AppStyles.headerLarge);
  }

  // Mood and Energy containers row
  Widget _buildMoodAndEnergyRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildMoodContainer(),
        const SizedBox(width: 20),
        _buildEnergyContainer(),
      ],
    );
  }

  // Mood container
  Widget _buildMoodContainer() {
    return Consumer<MoodProvider>(
      builder: (context, moodProvider, _) {
        final moodValue = moodProvider.currentMood?.value ?? 'Happy';
        return StatusContainer(
          title: 'Mood',
          imagePath: 'assets/images/smile_emoji.png',
          value: moodValue,
          routeName: AppRoutes.moodDetail,
        );
      },
    );
  }

  // Energy container
  Widget _buildEnergyContainer() {
    return Consumer<EnergyProvider>(
      builder: (context, energyProvider, _) {
        final energyValue =
            energyProvider.currentEnergy?.percentage.toString() ?? '70';
        return StatusContainer(
          title: 'Energy',
          imagePath: 'assets/images/water_level.png',
          value: '$energyValue%',
          routeName: AppRoutes.energyDetail,
        );
      },
    );
  }
}
