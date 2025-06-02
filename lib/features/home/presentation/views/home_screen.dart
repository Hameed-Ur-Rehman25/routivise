import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/date_time_helper.dart';
import 'package:routivise/features/mood_energy/presentation/providers/energy_provider.dart';
import 'package:routivise/features/mood_energy/presentation/providers/mood_provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/features/home/presentation/widgets/status_container.dart';
import 'package:routivise/core/widgets/custom_bottom_nav_bar.dart';
import 'package:routivise/features/home/presentation/widgets/routivise_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      drawer: const RoutiviseDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeaderSection(),
              Expanded(child: _buildTodaysRoutine()),
            ],
          ),
          Positioned(
            bottom: 0, // Position above bottom nav bar
            left: 0,
            right: 0,
            child: _buildQuickActionsSection(),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 4) {
            _scaffoldKey.currentState?.openDrawer();
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
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
              const SizedBox(
                height: 20,
              ), // Add some space before the next section if needed
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

  // Quick Actions Section
  Widget _buildQuickActionsSection() {
    return Container(
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickActionButton(
                  iconPath: 'assets/icons/dumbbell.svg',
                  label: 'New Workout\nPlan',
                  onPressed: () {
                    // TODO: Implement New Workout Plan navigation
                  },
                ),
                _buildQuickActionButton(
                  iconPath: 'assets/icons/fork-and-spoon.svg',
                  label: 'Meal\nPlanning',
                  onPressed: () {
                    // TODO: Implement Meal Planning navigation
                  },
                ),
                _buildQuickActionButton(
                  isIconData: true,
                  iconData: Icons.add,
                  label: 'Custom\nPlan',
                  onPressed: () {
                    // TODO: Implement Custom Plan navigation
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton({
    String? iconPath,
    IconData? iconData,
    bool isIconData = false,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 110,
      height: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          elevation: 2,
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isIconData
                ? Icon(iconData, size: 40, color: AppColors.gradientStart)
                : SvgPicture.asset(
                  iconPath!,
                  height: 35,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    AppColors.gradientStart,
                    BlendMode.srcIn,
                  ),
                ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaysRoutine() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Routine",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildRoutineItem(
                  icon: Icons.water_drop,
                  title: 'Drink Water',
                  time: '11:00 am',
                  description:
                      'drink a refreshing glass of water to start off you day!',
                  isDone: true,
                ),
                _buildRoutineItem(
                  icon: Icons.fitness_center,
                  title: 'Workout',
                  time: '11:05 am',
                  description:
                      'Time for your cardio! this 10 minute video will do just the trick!',
                  isDone: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineItem({
    required IconData icon,
    required String title,
    required String time,
    required String description,
    required bool isDone,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            // TODO: Implement routine item tap action
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.gradientStart.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: AppColors.gradientStart),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement done button action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDone ? AppColors.gradientStart : Colors.grey[200],
                        foregroundColor:
                            isDone ? Colors.white : Colors.grey[600],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(isDone ? 'Done!' : 'Todo'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
