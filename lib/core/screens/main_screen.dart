import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/features/home/presentation/views/home_screen.dart';
import 'package:routivise/features/goals_todo/presentation/views/goals_screen.dart';
import 'package:routivise/features/food/presentation/views/food_screen.dart';
import 'package:routivise/features/workout/presentation/views/workout_screen.dart';
import 'package:routivise/features/home/presentation/widgets/routivise_drawer.dart';

class MainScreen extends StatefulWidget {
  final int initialTabIndex;

  const MainScreen({super.key, this.initialTabIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Pages to be displayed in the bottom navigation
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex;

    // Initialize the pages
    _pages = [
      const HomeScreen(showNavBar: false),
      const GoalsScreen(showNavBar: false),
      // Exercise/Workout screen
      const WorkoutScreen(showNavBar: false),
      // Food screen
      const FoodScreen(showNavBar: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const RoutiviseDrawer(),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _handleNavigation,
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            height: 24,
            color: Colors.black54,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/mission.svg',
            height: 24,
            color: Colors.black54,
          ),
          label: 'Goals',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/dumbbell.svg',
            height: 24,
            color: Colors.black54,
          ),
          label: 'Exercise',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/fork-and-spoon.svg',
            height: 24,
            color: Colors.black54,
          ),
          label: 'Food',
        ),
        NavigationDestination(
          icon: SvgPicture.asset(
            'assets/icons/more.svg',
            height: 24,
            color: Colors.black54,
          ),
          label: 'More',
        ),
      ],
    );
  }

  void _handleNavigation(int index) {
    if (index == 4) {
      // Open drawer for More tab
      _scaffoldKey.currentState?.openDrawer();
    } else {
      setState(() => _selectedIndex = index);
    }
  }
}
