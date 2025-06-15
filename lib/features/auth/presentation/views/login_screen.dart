import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:routivise/app/routes.dart';
import 'package:routivise/app/theme.dart';
import 'package:routivise/core/utils/responsive_utils.dart';
import 'package:routivise/core/widgets/custom_button.dart';
import 'package:routivise/core/widgets/custom_snackbar.dart';
import 'package:routivise/core/widgets/custom_text_field.dart';
import 'package:routivise/features/auth/presentation/providers/auth_provider.dart';
import 'package:routivise/features/auth/presentation/widgets/social_sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Validate the form
    if (!_formKey.currentState!.validate()) {
      // Show form validation errors in snackbar
      CustomSnackBar.showError(context, 'Please fix the errors in the form');
      return;
    }

    final email = _emailController.text;
    final password = _passwordController.text;

    // Show loading indicator
    setState(() {
      _isLoading = true;
    });

    try {
      // Use the auth provider to sign in
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final success = await authProvider.signInWithEmailPassword(
        email,
        password,
      );

      if (mounted) {
        if (success) {
          // Show success message
          CustomSnackBar.showSuccess(context, 'Login successful!');
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else {
          // Show error message using custom snackbar
          CustomSnackBar.showError(
            context,
            authProvider.error ?? 'Login failed',
          );
        }
      }
    } catch (e) {
      // Handle any unexpected errors
      if (mounted) {
        CustomSnackBar.showError(context, 'An unexpected error occurred: $e');
      }
    } finally {
      // Hide loading indicator
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildLogo(double height) {
    return Center(
      child: SvgPicture.asset(
        'assets/routivise_logo.svg',
        height: height,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildTitle(bool isSmallScreen) {
    return Builder(
      builder: (context) {
        final responsive = context.responsive;

        return Center(
          child: Text(
            'Log In',
            style: TextStyle(
              fontSize: responsive.responsiveValue<double>(
                mobile: 20,
                tablet: 22,
                desktop: 24,
              ),
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmailField(bool isSmallScreen, double verticalSpacing) {
    return CustomTextField(
      label: 'Email:',
      controller: _emailController,
      hintText: 'johndoe@gmail.com',
      fieldName: 'Email',
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
    );
  }

  Widget _buildPasswordField(bool isSmallScreen, double verticalSpacing) {
    return CustomTextField(
      label: 'Password:',
      controller: _passwordController,
      hintText: '••••••••••••••••••••',
      fieldName: 'Password',
      obscureText: _obscurePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildForgotPassword() {
    return Builder(
      builder: (context) {
        final responsive = context.responsive;

        return Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // TODO: Implement forgot password functionality
              CustomSnackBar.showInfo(
                context,
                'Password reset functionality coming soon',
              );
            },
            child: Text(
              'Forget Password?',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: responsive.responsiveFontSize(14, min: 12, max: 16),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoginButton(bool isSmallScreen) {
    return CustomButton(
      text: 'Log In',
      onPressed: _handleLogin,
      type: ButtonType.primary,
      isLoading: _isLoading,
      fullWidth: true,
    );
  }

  Widget _buildSignupSection() {
    return Builder(
      builder: (context) {
        final responsive = context.responsive;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't Have an account?",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: responsive.responsiveFontSize(14, min: 12, max: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
              child: Text(
                'Signup Now',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.responsiveFontSize(14, min: 12, max: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOrDivider() {
    return Builder(
      builder: (context) {
        final responsive = context.responsive;

        return Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: responsive.responsivePadding(horizontal: 0.04),
              child: Text(
                'or',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: responsive.responsiveFontSize(14, min: 12, max: 16),
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        );
      },
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        SocialSignInButton(
          icon: 'assets/images/google_logo.png',
          text: 'Continue with Google',
          backgroundColor: const Color(0xFF4285F4),
          textColor: Colors.white,
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            try {
              final authProvider = Provider.of<AuthProvider>(
                context,
                listen: false,
              );
              final success = await authProvider.signInWithGoogle();
              if (mounted) {
                if (success) {
                  CustomSnackBar.showSuccess(
                    context,
                    'Google login successful!',
                  );
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                } else {
                  CustomSnackBar.showError(
                    context,
                    authProvider.error ?? 'Google login failed',
                  );
                }
              }
            } catch (e) {
              if (mounted) {
                CustomSnackBar.showError(
                  context,
                  'An unexpected error occurred: $e',
                );
              }
            } finally {
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            }
          },
        ),
        const SizedBox(height: 16),
        SocialSignInButton(
          icon: 'assets/images/facebook_logo.png',
          text: 'Continue with Facebook',
          backgroundColor: Colors.white,
          textColor: AppColors.textPrimary,
          borderColor: Colors.grey[300],
          onPressed: () {
            // TODO: Implement Facebook login
            CustomSnackBar.showInfo(
              context,
              'Facebook login not implemented yet',
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final bool isSmallScreen = responsive.width < 360;
    final double verticalSpacing = responsive.responsiveHeight(0.01);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: responsive.responsivePadding(
            horizontal: 0.06,
            vertical: 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(responsive.responsiveHeight(0.15)),
              _buildTitle(isSmallScreen),
              SizedBox(height: responsive.responsiveHeight(0.04)),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmailField(isSmallScreen, verticalSpacing),
                    SizedBox(height: responsive.responsiveHeight(0.02)),
                    _buildPasswordField(isSmallScreen, verticalSpacing),
                    _buildForgotPassword(),
                    _buildLoginButton(isSmallScreen),
                    SizedBox(height: responsive.responsiveHeight(0.025)),
                    _buildSignupSection(),
                    _buildOrDivider(),
                    SizedBox(height: responsive.responsiveHeight(0.02)),
                    _buildSocialButtons(),
                  ],
                ),
              ),
              SizedBox(height: responsive.responsiveHeight(0.03)),
            ],
          ),
        ),
      ),
    );
  }
}
