# Routivise - Project Instructions

## 📱 Project Overview

Routivise is an AI-powered customized daily routines app designed to help users establish and maintain healthy routines. The app offers features related to workouts, meal planning, mood tracking, goal setting, and routine management.

## 🏗️ Project Architecture

Routivise follows a clean architecture pattern with a feature-first approach. The codebase is organized as follows:

### Directory Structure

```
lib/
├── app/                  # Application-level configurations
│   ├── app.dart          # Main application widget
│   ├── routes.dart       # App routes
│   └── theme.dart        # App theming
├── core/                 # Core functionality and shared components
│   ├── constants/        # App-wide constants
│   ├── errors/           # Error handling
│   ├── screens/          # Base/common screens
│   ├── usecases/         # Base use cases
│   ├── utils/            # Utility functions
│   └── widgets/          # Reusable widgets
├── features/             # Feature modules
│   ├── auth/             # Authentication feature
│   ├── food/             # Food and nutrition tracking
│   ├── goals_todo/       # Goals and to-do lists
│   ├── mood_energy/      # Mood and energy tracking
│   ├── routines/         # Daily routines management
│   └── workout/          # Workout tracking
├── services/             # External services integration
└── main.dart             # Entry point
```

### Feature Structure

Each feature follows a layered architecture:

```
feature/
├── data/                # Data layer
│   ├── models/          # Data models
│   ├── repositories/    # Repository implementations
│   └── datasources/     # Data sources (local/remote)
├── domain/              # Domain layer
│   ├── entities/        # Business entities
│   ├── repositories/    # Repository interfaces
│   └── usecases/        # Business logic use cases
└── presentation/        # Presentation layer
    ├── providers/       # State management
    ├── screens/         # UI screens
    ├── widgets/         # Feature-specific widgets
    └── di/              # Dependency injection
```

## 💻 Coding Guidelines

### General Principles

1. **DRY (Don't Repeat Yourself)**: Avoid code duplication.
2. **SOLID Principles**: Follow SOLID principles for maintainable code.
3. **Single Responsibility**: Each class should have only one reason to change.
4. **Naming Conventions**: Use descriptive names for variables, methods, and classes.
5. **Documentation**: Add comments for complex logic and document public APIs.

### Dart/Flutter Specific

1. **Null Safety**: Ensure proper null safety practices.
2. **State Management**: Use Provider for state management.
3. **Async Code**: Use async/await for asynchronous operations.
4. **Error Handling**: Implement proper error handling using try/catch blocks.
5. **Code Formatting**: Follow the official Dart style guide.

## 🎨 UI/UX Guidelines

### Design System

1. **Colors**: Use only the colors defined in `AppColors` in the theme.dart file.
2. **Typography**: Use the text styles defined in `AppStyles`.
3. **Spacing**: Maintain consistent spacing using predefined constants.

### Responsive Design

1. **MediaQuery**: Use MediaQuery to adapt layouts to different screen sizes.
2. **Flexible Layouts**: Use Expanded, Flexible, and FractionallySizedBox for proportional layouts.
3. **Device Preview**: Test on different device sizes during development.
4. **Orientation Support**: Support both portrait and landscape orientations when appropriate.

### Accessibility

1. **Semantic Labels**: Add semantic labels to important widgets.
2. **Sufficient Contrast**: Ensure text has sufficient contrast with backgrounds.
3. **Touch Targets**: Make touch targets at least 48x48 pixels.

## 🧩 Custom Widgets

### Core Widgets

Routivise has several custom widgets that should be used throughout the app:

1. **GradientScaffold**: A scaffold with a gradient background.

   ```dart
   GradientScaffold(
     body: YourContent(),
     gradientColors: [AppColors.gradientStart, AppColors.gradientEnd],
   )
   ```

2. **GradientAppBar**: An app bar with gradient background.

   ```dart
   GradientAppBar(
     title: 'Screen Title',
     actions: [YourActionWidgets],
   )
   ```

3. **CustomBottomNavBar**: A custom bottom navigation bar.

   ```dart
   CustomBottomNavBar(
     selectedIndex: _currentIndex,
     onItemTapped: (index) => setState(() => _currentIndex = index),
   )
   ```

4. **RoutineCard**: A card displaying routine information.
   ```dart
   RoutineCard(
     routine: routineData,
     onTap: () => handleRoutineTap(routineData),
   )
   ```

### Creating New Custom Widgets

When creating new custom widgets:

1. **Place appropriately**: Put feature-specific widgets in the feature's presentation/widgets folder and shared widgets in core/widgets.
2. **Make them reusable**: Design widgets to be reusable with customizable parameters.
3. **Document parameters**: Add documentation comments for all parameters.
4. **Add examples**: Include usage examples in doc comments.

## 📱 Responsive Design Implementation

### Screen Size Adaption

```dart
// Get screen dimensions
final screenWidth = MediaQuery.of(context).size.width;
final screenHeight = MediaQuery.of(context).size.height;

// Calculate responsive sizes
final buttonHeight = screenHeight * 0.06;
final iconSize = screenWidth * 0.06;
```

### Device-Specific Adjustments

```dart
// Example of adapting layout based on screen size
Widget buildResponsiveLayout(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return screenWidth > 600
      ? buildWideLayout()
      : buildNarrowLayout();
}
```

### Orientation Changes

```dart
// Example of handling orientation changes
Widget buildOrientationAware(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;

  return orientation == Orientation.portrait
      ? buildPortraitLayout()
      : buildLandscapeLayout();
}
```

## 🔄 State Management

Routivise uses Provider for state management. Each feature has its own providers:

```dart
// Example of registering providers
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => MoodProvider()),
    // Other providers
  ],
  child: MaterialApp(...),
)
```

### Creating New Providers

1. Create a new provider class that extends ChangeNotifier.
2. Register the provider in the nearest ancestor widget that needs access to the state.
3. Use Consumer or Provider.of to access the provider in child widgets.

## 🧪 Testing Guidelines

1. **Unit Tests**: Write tests for all business logic in the domain layer.
2. **Widget Tests**: Create tests for UI components and interactions.
3. **Integration Tests**: Test the interaction between different parts of the app.
4. **Provider Tests**: Test state management logic.

## 📦 Asset Management

1. Place all assets in the appropriate directories under `/assets`.
2. Use constants for asset paths to avoid string duplication.
3. Add all assets to the pubspec.yaml file.

## 🚀 Performance Considerations

1. **Lazy Loading**: Implement lazy loading for lists and heavy resources.
2. **Image Optimization**: Use appropriate image formats and sizes.
3. **Caching**: Implement caching for network requests.
4. **Widget Rebuilds**: Minimize unnecessary widget rebuilds.

## 🔒 Security Best Practices

1. **Secure Storage**: Use secure storage for sensitive information.
2. **Input Validation**: Validate all user inputs.
3. **Authentication**: Implement secure authentication mechanisms.
4. **API Security**: Use HTTPS for all network requests.

---

This document serves as a guide for developing and maintaining the Routivise application. Always refer to this document when adding new features or making changes to ensure consistency across the codebase.
