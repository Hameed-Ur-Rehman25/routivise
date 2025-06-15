import 'package:flutter/material.dart';

/// Utility class for responsive UI calculations
///
/// This class provides methods and properties to determine device type,
/// screen size, and calculate responsive dimensions for the UI.
class ResponsiveUtils {
  /// Singleton instance
  static final ResponsiveUtils _instance = ResponsiveUtils._internal();

  /// Factory constructor to return the singleton instance
  factory ResponsiveUtils() => _instance;

  /// Private constructor for singleton pattern
  ResponsiveUtils._internal();

  /// Current BuildContext, set when initializing
  late BuildContext _context;

  /// Initialize with the current BuildContext
  void init(BuildContext context) {
    _context = context;
  }

  /// Get the current MediaQueryData
  MediaQueryData get _mediaQuery => MediaQuery.of(_context);

  /// Get the screen size
  Size get screenSize => _mediaQuery.size;

  /// Get the screen width
  double get width => screenSize.width;

  /// Get the screen height
  double get height => screenSize.height;

  /// Get orientation
  Orientation get orientation => _mediaQuery.orientation;

  /// Screen width breakpoints
  static const double _mobileBreakpoint = 480;
  static const double _tabletBreakpoint = 768;
  static const double _desktopBreakpoint = 1200;

  /// Check if the screen is considered mobile size
  bool get isMobile => width < _mobileBreakpoint;

  /// Check if the screen is considered tablet size
  bool get isTablet => width >= _mobileBreakpoint && width < _tabletBreakpoint;

  /// Check if the screen is considered desktop size
  bool get isDesktop => width >= _desktopBreakpoint;

  /// Calculate responsive font size
  double responsiveFontSize(double base, {double? min, double? max}) {
    double size = base * (width / 375); // Scale based on iPhone 8 width

    if (min != null) size = size < min ? min : size;
    if (max != null) size = size > max ? max : size;

    return size;
  }

  /// Calculate responsive height based on percentage of screen height
  double responsiveHeight(double percent) {
    return height * percent;
  }

  /// Calculate responsive width based on percentage of screen width
  double responsiveWidth(double percent) {
    return width * percent;
  }

  /// Calculate responsive padding based on screen size
  EdgeInsets responsivePadding({
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left:
          left != null
              ? responsiveWidth(left)
              : (horizontal != null ? responsiveWidth(horizontal) : 0),
      top:
          top != null
              ? responsiveHeight(top)
              : (vertical != null ? responsiveHeight(vertical) : 0),
      right:
          right != null
              ? responsiveWidth(right)
              : (horizontal != null ? responsiveWidth(horizontal) : 0),
      bottom:
          bottom != null
              ? responsiveHeight(bottom)
              : (vertical != null ? responsiveHeight(vertical) : 0),
    );
  }

  /// Calculate responsive size (width and height)
  Size responsiveSize(double width, double height) {
    return Size(responsiveWidth(width), responsiveHeight(height));
  }

  /// Calculate responsive value based on device type
  T responsiveValue<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop && desktop != null) {
      return desktop;
    }

    if (isTablet && tablet != null) {
      return tablet;
    }

    return mobile;
  }

  /// Calculate responsive spacing (SizedBox)
  Widget horizontalSpace(double width) =>
      SizedBox(width: responsiveWidth(width));
  Widget verticalSpace(double height) =>
      SizedBox(height: responsiveHeight(height));
}

/// Extension to easily access ResponsiveUtils from BuildContext
extension ResponsiveUtilsExtension on BuildContext {
  /// Get the ResponsiveUtils instance initialized with this context
  ResponsiveUtils get responsive {
    final utils = ResponsiveUtils();
    utils.init(this);
    return utils;
  }

  /// Shorthand for access to screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Shorthand for access to screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Shorthand for checking if device is in portrait mode
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Shorthand for checking if device is in landscape mode
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}
