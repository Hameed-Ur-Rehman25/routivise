import 'package:flutter/material.dart';

import '../constants/profile_constants.dart';

/// A simple divider widget with standardized styling for the profile screen
class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        height: 1,
        color: Color(ProfileConstants.dividerColorValue),
      ),
    );
  }
}
