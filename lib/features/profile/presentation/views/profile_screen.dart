import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/features/preferences/presentation/views/preferences_screen.dart';
import '../widgets/profile_widgets.dart';

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
          // Gradient AppBar and header
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gradientStart, AppColors.gradientEnd],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                       icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Workouts
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Workouts',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '28',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: Color(
                              0xFFDFE3E6,
                            ), // Slightly darker grey for better visibility
                            thickness: 1,
                            width: 24,
                            indent: 8,
                            endIndent: 8,
                          ),
                          // Days
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Days',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: Color(
                              0xFFDFE3E6,
                            ), // Slightly darker grey for better visibility
                            thickness: 1,
                            width: 24,
                            indent: 8,
                            endIndent: 8,
                          ),
                          // Consistency
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Consistency',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '94%',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // Settings List
          Expanded(
            child: Container(
              width: double.infinity,
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFFFFF), Color(0xFFEAE9E9)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 0,
                ),
                children: [
                  SettingsTile(
                    icon: 'assets/icons/user.svg',
                    label: 'My Info',
                    onTap: () {
                      Navigator.pushNamed(context, '/info');
                    },
                  ),
                  ProfileDivider(),
                  SettingsTile(
                    icon: 'assets/icons/notification.svg',
                    label: 'Push Notification',
                    trailing: Switch(
                      value: pushNotification,
                      onChanged:
                          (val) => setState(() => pushNotification = val),
                      activeColor: const Color(0xFF1999F9),
                      inactiveTrackColor: const Color(0xFFB5B1BE),
                    ),
                  ),
                  ProfileDivider(),
                  SettingsTile(
                    icon: 'assets/icons/help_support.svg',
                    label: 'Help & Support',
                    onTap: () {},
                  ),
                  ProfileDivider(),
                  SettingsTile(
                    icon: 'assets/icons/value.svg',
                    label: 'Subscription',
                    onTap: () {
                      Navigator.pushNamed(context, '/subscribe');
                    },
                  ),
                  ProfileDivider(),
                  SettingsTile(
                    icon: 'assets/icons/preferences.svg',
                    label: 'Preferences',
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
            ),
          ),
        ],
      ),
    );
  }
}
