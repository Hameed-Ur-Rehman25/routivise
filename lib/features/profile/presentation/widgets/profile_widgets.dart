import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatBox extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  const StatBox({
    required this.label,
    required this.value,
    this.isBold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String icon;
  final String label;
  final Widget? trailing;
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
        color: const Color(0xFF1999F9),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Color(0xFF222B45)),
      ),
      trailing:
          trailing ?? const Icon(Icons.chevron_right, color: Color(0xFF8F9BB3)),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      minLeadingWidth: 32,
    );
  }
}

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Divider(height: 1, color: Color(0xFFB5B1BE)),
    );
  }
}
