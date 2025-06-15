import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/responsive_utils.dart';

enum SnackBarType { success, error, info, warning }

/// A custom floating snackbar for consistent messaging across the app
///
/// This class provides a customizable, floating snackbar with different
/// styles based on the message type (success, error, info, warning).
class CustomSnackBar {
  /// Show a floating snackbar with the specified message and type
  ///
  /// [context] The BuildContext to show the snackbar in
  /// [message] The message to display in the snackbar
  /// [type] The type of snackbar (success, error, info, warning)
  /// [duration] How long to show the snackbar for
  static void show({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration? duration,
  }) {
    final responsive = context.responsive;

    // Define colors and icons based on snackbar type
    Color backgroundColor;
    Color borderColor;
    IconData icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green.shade50;
        borderColor = Colors.green;
        icon = Icons.check_circle;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red.shade50;
        borderColor = AppColors.error;
        icon = Icons.error;
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.amber.shade50;
        borderColor = Colors.amber;
        icon = Icons.warning;
        break;
      case SnackBarType.info:
      default:
        backgroundColor = Colors.blue.shade50;
        borderColor = AppColors.primary;
        icon = Icons.info;
        break;
    }

    // Calculate responsive dimensions
    final double snackBarWidth = responsive.responsiveValue<double>(
      mobile: responsive.width * 0.9,
      tablet: responsive.width * 0.7,
      desktop: responsive.width * 0.4,
    );

    final double iconSize = responsive.responsiveFontSize(24, min: 20, max: 28);
    final double fontSize = responsive.responsiveFontSize(14, min: 12, max: 16);

    // Create and show the snackbar
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration ?? const Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: responsive.height * 0.08,
        left: (responsive.width - snackBarWidth) / 2,
        right: (responsive.width - snackBarWidth) / 2,
      ),
      padding: EdgeInsets.zero,
      dismissDirection: DismissDirection.horizontal,
      content: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.responsiveWidth(0.04),
          vertical: responsive.responsiveHeight(0.015),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: borderColor, size: iconSize),
            SizedBox(width: responsive.responsiveWidth(0.02)),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Icon(
                Icons.close,
                color: borderColor,
                size: iconSize * 0.8,
              ),
            ),
          ],
        ),
      ),
    );

    // Hide any current snackbar and show the new one
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show a success snackbar
  static void showSuccess(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.success,
      duration: duration,
    );
  }

  /// Show an error snackbar
  static void showError(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.error,
      duration: duration,
    );
  }

  /// Show an info snackbar
  static void showInfo(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.info,
      duration: duration,
    );
  }

  /// Show a warning snackbar
  static void showWarning(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.warning,
      duration: duration,
    );
  }

  /// Show form field error using a snackbar instead of inline validation
  static void showFieldError(
    BuildContext context,
    String fieldName,
    String error,
  ) {
    showError(context, '$fieldName: $error');
  }
}
