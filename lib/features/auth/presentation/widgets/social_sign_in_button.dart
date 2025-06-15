import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/responsive_utils.dart';

/// A responsive social sign-in button widget
///
/// This widget creates a consistent styled button for social authentication
/// methods like Google, Facebook, etc.
class SocialSignInButton extends StatelessWidget {
  final String icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  /// Constructor for the SocialSignInButton
  ///
  /// [icon] Path to the social platform icon/logo
  /// [text] The button text
  /// [backgroundColor] Button background color
  /// [textColor] Text color
  /// [borderColor] Optional border color
  /// [onPressed] Callback function when button is pressed
  const SocialSignInButton({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Get responsive utilities with context extension
    final responsive = context.responsive;

    // Use responsive values based on device type
    final buttonHeight = responsive.responsiveValue<double>(
      mobile: 48.0,
      tablet: 56.0,
      desktop: 60.0,
    );
    final iconSize = responsive.responsiveValue<double>(
      mobile: 20.0,
      tablet: 24.0,
      desktop: 28.0,
    );
    final fontSize = responsive.responsiveValue<double>(
      mobile: 14.0,
      tablet: 16.0,
      desktop: 18.0,
    );
    final horizontalPadding = responsive.responsiveWidth(0.05);
    final borderRadius = responsive.responsiveValue<double>(
      mobile: 24.0,
      tablet: 30.0,
      desktop: 32.0,
    );

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: horizontalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Check if icon is an SVG or regular asset
            icon.endsWith('.svg')
                ? SvgPicture.asset(icon, width: iconSize, height: iconSize)
                : Image.asset(icon, width: iconSize, height: iconSize),
            SizedBox(width: responsive.responsiveWidth(0.03)),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
