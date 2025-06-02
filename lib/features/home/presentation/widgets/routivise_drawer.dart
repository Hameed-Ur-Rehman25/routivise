import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/app/theme.dart';

class RoutiviseDrawer extends StatelessWidget {
  const RoutiviseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFEAE9E9)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: SvgPicture.asset(
                'assets/routivise_logo.svg',
                height: 150,
                color: AppColors.primary,
              ),
            ),
            // const SizedBox(height: 40),
            _drawerItem(
              iconAsset: 'assets/icons/user.svg',
              label: 'Profile',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/profile');
              },
              isSvg: true,
            ),
            _drawerItem(
              iconAsset: 'assets/icons/smile.svg',
              label: 'Mood Logging',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/mood-detail');
              },
              isSvg: true,
            ),
            _drawerItem(
              iconAsset: 'assets/icons/thunder.svg',
              label: 'Energy Logging',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/energy-detail');
              },
              isSvg: true,
            ),
            _drawerItem(
              iconAsset: 'assets/icons/drawer.svg',
              label: 'Review Routines',
              onTap: () {
                Navigator.of(context).pop();
                // You can create a route for this in the future
                // For now, we'll just navigate to home
                Navigator.of(context).pushNamed('/home');
              },
              trailing: SvgPicture.asset(
                'assets/icons/value.svg',
                height: 16,
                color: Color(0xFF1999F9),
              ),
              isSvg: true,
            ),
            _drawerItem(
              iconAsset: 'assets/icons/value.svg',
              label: 'Subscribe Now!',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/subscribe');
              },
              isSvg: true,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/out.svg',
                      height: 22,
                      color: Color(0xFF1999F9),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Logout',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    IconData? icon,
    String? iconAsset,
    required String label,
    required VoidCallback onTap,
    Widget? trailing,
    bool isImage = false,
    bool isSvg = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            if (icon != null) Icon(icon, color: Color(0xFF1999F9), size: 24),
            if (iconAsset != null && isImage)
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Image.asset(iconAsset, height: 24, width: 24),
              ),
            if (iconAsset != null && isSvg)
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: SvgPicture.asset(
                  iconAsset,
                  height: 24,
                  color: Color(0xFF1999F9),
                ),
              ),
            if (icon != null || iconAsset != null) const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            if (trailing != null) ...[const SizedBox(width: 8), trailing],
          ],
        ),
      ),
    );
  }
}
