import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

/// A responsive widget that adapts based on screen size
///
/// This widget can display different content based on whether the
/// device is in mobile, tablet, or desktop view.
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  /// Constructor for the ResponsiveWidget
  ///
  /// [mobile] Required widget for mobile view
  /// [tablet] Optional widget for tablet view, defaults to mobile if null
  /// [desktop] Optional widget for desktop view, defaults to tablet view if null
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    // Get responsive utilities for this context
    final responsive = context.responsive;

    // Return the appropriate widget based on screen size
    if (responsive.isDesktop && desktop != null) {
      return desktop!;
    }

    if (responsive.isTablet && tablet != null) {
      return tablet!;
    }

    // Default to mobile view
    return mobile;
  }
}

/// Extension on a widget that adds responsive builder method
extension ResponsiveWidgetExtension on Widget {
  /// Wrap this widget in a responsive builder that renders differently based on screen size
  Widget responsive({
    Widget Function(BuildContext, Widget)? onMobile,
    Widget Function(BuildContext, Widget)? onTablet,
    Widget Function(BuildContext, Widget)? onDesktop,
  }) {
    return Builder(
      builder: (context) {
        final responsive = context.responsive;
        Widget result = this;

        if (responsive.isDesktop && onDesktop != null) {
          return onDesktop(context, result);
        }

        if (responsive.isTablet && onTablet != null) {
          return onTablet(context, result);
        }

        if (onMobile != null) {
          return onMobile(context, result);
        }

        return result;
      },
    );
  }
}
