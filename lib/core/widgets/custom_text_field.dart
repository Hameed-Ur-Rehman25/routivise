import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/responsive_utils.dart';
import 'package:routivise/core/widgets/custom_snackbar.dart';

/// A custom text form field with built-in validation and error handling
///
/// This widget provides a consistent text field design across the app
/// and uses custom snackbars for validation errors instead of inline error messages.
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final String fieldName; // For error message display

  /// Constructor for CustomTextField
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.fieldName,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    // Calculate responsive sizes
    final fontSize = responsive.responsiveFontSize(16, min: 14, max: 18);
    final labelFontSize = responsive.responsiveFontSize(16, min: 14, max: 18);
    final contentPadding = responsive.responsivePadding(
      horizontal: 0.04,
      vertical: 0.02,
    );
    final verticalSpacing = responsive.responsiveHeight(0.01);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Field label
        Text(
          label,
          style: TextStyle(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: verticalSpacing),

        // Text field
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          focusNode: focusNode,
          autofocus: autofocus,
          textCapitalization: textCapitalization,
          style: TextStyle(fontSize: fontSize, color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: fontSize,
            ),
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: suffixIcon,
          ),
          validator: (value) {
            if (validator != null) {
              final error = validator!(value);
              if (error != null && error.isNotEmpty) {
                // We'll show the snackbar on form submission instead of here
                // to avoid multiple snackbars when validating multiple fields
                return error;
              }
            }
            return null;
          },
          onFieldSubmitted: (_) {
            // Show error with snackbar if validation fails
            final error = validator?.call(controller.text);
            if (error != null && error.isNotEmpty) {
              CustomSnackBar.showFieldError(context, fieldName, error);
            }
          },
        ),
      ],
    );
  }
}
