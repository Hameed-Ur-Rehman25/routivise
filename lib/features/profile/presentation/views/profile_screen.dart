// filepath: /Users/pc/Desktop/routivise/lib/features/profile/presentation/views/profile_screen.dart
import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/settings_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pushNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profile header with gradient background and stats
          ProfileHeader(
            userName: 'John Doe',
            workoutsCount: '28',
            daysCount: '20',
            consistencyPercentage: '94%',
            onBackPressed: () => Navigator.of(context).pop(),
          ),
          // Settings list
          Expanded(
            child: SettingsList(
              pushNotificationEnabled: pushNotification,
              onPushNotificationChanged: (value) {
                setState(() => pushNotification = value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
