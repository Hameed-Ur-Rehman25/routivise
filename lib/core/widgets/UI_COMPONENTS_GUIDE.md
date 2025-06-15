# UI Components Guide

This guide documents the custom UI components available in the Routivise app and how to use them effectively.

## 📱 Responsive Utilities

The app includes a comprehensive responsive system. See the detailed documentation in `lib/core/utils/RESPONSIVE_SYSTEM_README.md`.

## 🎨 Custom Widgets

### CustomSnackBar

A floating snackbar for displaying messages and errors consistently across the app.

#### Usage

```dart
// Show different types of notifications
CustomSnackBar.showSuccess(context, 'Successfully saved!');
CustomSnackBar.showError(context, 'An error occurred');
CustomSnackBar.showInfo(context, 'New message received');
CustomSnackBar.showWarning(context, 'Battery is low');

// Show field validation errors
CustomSnackBar.showFieldError(context, 'Email', 'Please enter a valid email address');
```

### CustomTextField

A responsive text field that integrates with the CustomSnackBar for validation errors.

#### Usage

```dart
CustomTextField(
  label: 'Email',
  controller: _emailController,
  hintText: 'your.email@example.com',
  fieldName: 'Email', // Used in error messages
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
    }
    return null;
  },
)
```

### CustomButton

A responsive button with multiple style variants and loading state support.

#### Usage

```dart
// Primary button (full width)
CustomButton(
  text: 'Login',
  onPressed: _handleLogin,
  type: ButtonType.primary,
  fullWidth: true,
  isLoading: _isLoading,
)

// Outline button with icon
CustomButton(
  text: 'Add Item',
  onPressed: _addItem,
  type: ButtonType.outline,
  icon: Icon(Icons.add),
)

// Text button
CustomButton(
  text: 'Cancel',
  onPressed: () => Navigator.pop(context),
  type: ButtonType.text,
)
```

### SocialSignInButton

A specialized button for social authentication options.

#### Usage

```dart
SocialSignInButton(
  icon: 'assets/icons/google_logo.png',
  text: 'Continue with Google',
  backgroundColor: Colors.white,
  textColor: AppColors.textPrimary,
  borderColor: Colors.grey.shade300,
  onPressed: _handleGoogleSignIn,
)
```

## 🧩 Common Patterns

### Form Validation with Snackbar Errors

```dart
final _formKey = GlobalKey<FormState>();

void _handleSubmit() {
  // Validate the form
  if (!_formKey.currentState!.validate()) {
    // Show an error message
    CustomSnackBar.showError(context, 'Please fix the errors in the form');
    return;
  }

  // Proceed with form submission
  // ...
}

// In the build method:
Form(
  key: _formKey,
  child: Column(
    children: [
      CustomTextField(
        // ... field properties
      ),
      // ... more fields
      CustomButton(
        text: 'Submit',
        onPressed: _handleSubmit,
      ),
    ],
  ),
)
```

### Loading State Management

```dart
bool _isLoading = false;

Future<void> _handleAction() async {
  setState(() {
    _isLoading = true;
  });

  try {
    // Perform async operation
    await _someAsyncOperation();

    // Show success message
    CustomSnackBar.showSuccess(context, 'Operation completed successfully');
  } catch (e) {
    // Show error message
    CustomSnackBar.showError(context, 'Failed to complete operation');
  } finally {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

// In the build method:
CustomButton(
  text: 'Submit',
  onPressed: _handleAction,
  isLoading: _isLoading,
)
```

## 📐 Spacing Guidelines

Use the responsive utilities for consistent spacing:

```dart
// Vertical spacing
SizedBox(height: context.responsive.responsiveHeight(0.02)),

// Horizontal spacing
SizedBox(width: context.responsive.responsiveWidth(0.04)),

// Or use the convenience methods
context.responsive.verticalSpace(0.02),
context.responsive.horizontalSpace(0.04),
```
