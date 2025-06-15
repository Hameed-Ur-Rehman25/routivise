# Responsive UI System for Routivise

This document explains the responsive UI system implemented in the Routivise project to create consistent, adaptive layouts across different device sizes.

## 🧰 Available Tools

### 1. ResponsiveUtils

`ResponsiveUtils` is a utility class that provides screen size detection and responsive sizing methods. It's available through a convenient BuildContext extension.

#### Basic Usage

```dart
// Access responsive utilities in any widget's build method
Widget build(BuildContext context) {
  final responsive = context.responsive;

  // Now you can use any of the responsive methods
  return Container(
    width: responsive.responsiveWidth(0.8),  // 80% of screen width
    height: responsive.responsiveHeight(0.1), // 10% of screen height
    child: Text(
      'Hello World',
      style: TextStyle(
        fontSize: responsive.responsiveFontSize(16, min: 14, max: 20),
      ),
    ),
  );
}
```

#### Key Features

- **Device Type Detection**

  ```dart
  if (context.responsive.isMobile) { /* Mobile specific logic */ }
  if (context.responsive.isTablet) { /* Tablet specific logic */ }
  if (context.responsive.isDesktop) { /* Desktop specific logic */ }
  ```

- **Responsive Dimensions**

  ```dart
  // Responsive sizing based on screen percentages
  width: responsive.responsiveWidth(0.5),    // 50% of screen width
  height: responsive.responsiveHeight(0.1),  // 10% of screen height

  // Responsive font sizes with optional min/max constraints
  fontSize: responsive.responsiveFontSize(16, min: 12, max: 24),

  // Responsive padding
  padding: responsive.responsivePadding(horizontal: 0.05, vertical: 0.02),
  ```

- **Conditional Values**

  ```dart
  // Different values based on device type
  fontSize: responsive.responsiveValue<double>(
    mobile: 14,
    tablet: 16,
    desktop: 18,
  ),
  ```

- **Responsive Spacing**

  ```dart
  // Add horizontal space based on screen width
  responsive.horizontalSpace(0.05), // 5% of screen width

  // Add vertical space based on screen height
  responsive.verticalSpace(0.02),   // 2% of screen height
  ```

- **Shorthand Properties**

  ```dart
  // Quick access to screen dimensions
  double width = context.screenWidth;
  double height = context.screenHeight;

  // Check orientation
  if (context.isPortrait) { /* Portrait specific layout */ }
  if (context.isLandscape) { /* Landscape specific layout */ }
  ```

### 2. ResponsiveWidget

`ResponsiveWidget` allows you to provide different widget implementations for different screen sizes.

#### Basic Usage

```dart
ResponsiveWidget(
  mobile: MobileView(),
  tablet: TabletView(),  // Optional, defaults to mobile if not provided
  desktop: DesktopView(), // Optional, defaults to tablet if not provided
)
```

#### Widget Extension

There's also a convenient extension method on Widget:

```dart
MyWidget().responsive(
  onMobile: (context, widget) => Padding(
    padding: EdgeInsets.all(8),
    child: widget,
  ),
  onTablet: (context, widget) => Padding(
    padding: EdgeInsets.all(16),
    child: widget,
  ),
  onDesktop: (context, widget) => Padding(
    padding: EdgeInsets.all(24),
    child: widget,
  ),
)
```

## 📱 Best Practices

1. **Always use the responsive utilities** for sizes, padding, and margins to ensure your UI adapts well to different screen sizes.

2. **Avoid hardcoded dimensions** wherever possible. Instead, use the responsive percentage-based methods.

3. **Set min/max constraints** for font sizes to ensure text remains readable even on very small or very large screens.

4. **Test on multiple device sizes** to ensure your UI looks good across different form factors.

5. **Use ResponsiveWidget** when you need completely different layouts for different screen sizes.

## 📏 Screen Size Breakpoints

- **Mobile**: < 480px
- **Tablet**: 480px - 768px
- **Desktop**: > 1200px

You can adjust these breakpoints in the `ResponsiveUtils` class if needed for your specific design requirements.
