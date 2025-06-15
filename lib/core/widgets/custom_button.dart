import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/responsive_utils.dart';

/// Button types for CustomButton
enum ButtonType { primary, secondary, outline, text }

/// A custom responsive button widget
///
/// This widget provides a consistent button design across the app
/// with different styles based on the button type.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool isLoading;
  final bool fullWidth;
  final Widget? icon;
  final double? height;

  /// Constructor for CustomButton
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.fullWidth = false,
    this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    // Get button style based on type
    final ButtonStyle buttonStyle = _getButtonStyle(context, type);

    // Calculate responsive dimensions
    final buttonHeight =
        height ??
        responsive.responsiveValue<double>(mobile: 48, tablet: 54, desktop: 60);

    final fontSize = responsive.responsiveFontSize(16, min: 14, max: 18);

    // Create the button with appropriate style
    Widget button;

    // Based on button type, create the appropriate button widget
    switch (type) {
      case ButtonType.primary:
      case ButtonType.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: _buildButtonContent(fontSize),
        );
        break;
      case ButtonType.outline:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: _buildButtonContent(fontSize),
        );
        break;
      case ButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: buttonStyle,
          child: _buildButtonContent(fontSize),
        );
        break;
    }

    // Apply full width if needed
    return fullWidth
        ? SizedBox(width: double.infinity, height: buttonHeight, child: button)
        : SizedBox(height: buttonHeight, child: button);
  }

  // Build the content of the button (text, icon, loading indicator)
  Widget _buildButtonContent(double fontSize) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == ButtonType.primary ? Colors.white : AppColors.primary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
    );
  }

  // Get button style based on type
  ButtonStyle _getButtonStyle(BuildContext context, ButtonType type) {
    final responsive = context.responsive;

    final borderRadius = BorderRadius.circular(
      responsive.responsiveValue<double>(mobile: 24, tablet: 30, desktop: 32),
    );

    // Define styles for each button type
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 0,
          padding: responsive.responsivePadding(horizontal: 0.05),
          disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
          disabledForegroundColor: Colors.white70,
        );
      case ButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          elevation: 0,
          padding: responsive.responsivePadding(horizontal: 0.05),
          disabledBackgroundColor: AppColors.secondary.withOpacity(0.6),
          disabledForegroundColor: Colors.white70,
        );
      case ButtonType.outline:
        return OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          side: const BorderSide(color: AppColors.primary),
          padding: responsive.responsivePadding(horizontal: 0.05),
        );
      case ButtonType.text:
        return TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: responsive.responsivePadding(horizontal: 0.03),
        );
    }
  }
}
