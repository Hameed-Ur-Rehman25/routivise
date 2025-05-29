import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/app/theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/home.svg', height: 24, color: Colors.black,),
          label: 'Home',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/mission.svg', height: 24),
          label: 'Goals',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/dumbbell.svg', height: 24),
          label: 'Exercise',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/fork-and-spoon.svg', height: 24),
          label: 'Food',
        ),
        NavigationDestination(
          icon: SvgPicture.asset('assets/icons/more.svg', height: 24),
          label: 'More',
        ),
      ],
    );
  }
}
