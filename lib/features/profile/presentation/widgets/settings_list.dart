import 'package:flutter/material.dart';
import 'package:routivise/features/preferences/presentation/views/preferences_screen.dart';

import '../constants/profile_constants.dart';
import 'profile_divider.dart';
import 'settings_tile.dart';

/// List of settings options in the profile screen
class SettingsList extends StatelessWidget {
  /// Current state of push notification setting
  final bool pushNotificationEnabled;

  /// Callback when push notification setting changes
  final ValueChanged<bool> onPushNotificationChanged;

  const SettingsList({
    required this.pushNotificationEnabled,
    required this.onPushNotificationChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFEAE9E9)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
        children: [
          SettingsTile(
            icon: ProfileConstants.userIconPath,
            label: ProfileConstants.myInfoLabel,
            onTap: () {
              Navigator.pushNamed(context, ProfileConstants.infoRoute);
            },
          ),
          const ProfileDivider(),
          SettingsTile(
            icon: ProfileConstants.notificationIconPath,
            label: ProfileConstants.pushNotificationLabel,
            trailing: Switch(
              value: pushNotificationEnabled,
              onChanged: onPushNotificationChanged,
              activeColor: const Color(ProfileConstants.primaryBlueColorValue),
              inactiveTrackColor: const Color(
                ProfileConstants.inactiveGreyColorValue,
              ),
            ),
          ),
          const ProfileDivider(),
          SettingsTile(
            icon: ProfileConstants.helpSupportIconPath,
            label: ProfileConstants.helpSupportLabel,
            onTap: () {
              // Help & Support action - to be implemented
            },
          ),
          const ProfileDivider(),
          SettingsTile(
            icon: ProfileConstants.valueIconPath,
            label: ProfileConstants.subscriptionLabel,
            onTap: () {
              Navigator.pushNamed(context, ProfileConstants.subscribeRoute);
            },
          ),
          const ProfileDivider(),
          SettingsTile(
            icon: ProfileConstants.preferencesIconPath,
            label: ProfileConstants.preferencesLabel,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PreferencesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
