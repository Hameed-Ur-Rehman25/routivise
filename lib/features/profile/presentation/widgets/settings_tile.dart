import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/profile_constants.dart';

/// A tile for displaying a setting with an icon and optional trailing widget
class SettingsTile extends StatelessWidget {
  /// SVG asset path for the icon
  final String icon;

  /// Label text for the setting
  final String label;

  /// Optional trailing widget (defaults to a chevron icon)
  final Widget? trailing;

  /// Callback when the tile is tapped
  final VoidCallback? onTap;

  const SettingsTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        height: 24,
        color: const Color(ProfileConstants.primaryBlueColorValue),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: Color(ProfileConstants.textDarkColorValue),
        ),
      ),
      trailing:
          trailing ??
          const Icon(
            Icons.chevron_right,
            color: Color(ProfileConstants.iconGreyColorValue),
          ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      minLeadingWidth: 32,
    );
  }
}
