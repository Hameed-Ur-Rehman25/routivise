import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:routivise/features/subscription/domain/models/subscription_plan.dart';
import 'package:routivise/features/subscription/domain/repositories/subscription_repository_interface.dart';
import 'package:routivise/features/subscription/presentation/models/subscription_animation_config.dart';

/// Implementation of subscription repository
class SubscriptionRepository implements ISubscriptionRepository {
  final SubscriptionAnimationConfig _config =
      SubscriptionAnimationConfig.defaultConfig();

  @override
  Duration getAnimationDuration() {
    return _config.duration;
  }

  @override
  Curve getAnimationCurve() {
    return _config.curve;
  }

  @override
  SubscriptionAnimationConfig getAnimationConfig() {
    return _config;
  }

  @override
  Color getPremiumProBorderColor() {
    return const Color(0xFFFF9A0C);
  }

  @override
  Color getPremiumBorderColor() {
    return const Color(0xFF1987DA);
  }

  @override
  Color getStandardBorderColor() {
    return Colors.black;
  }

  @override
  List<SubscriptionPlan> getSubscriptionPlans() {
    return [
      SubscriptionPlan(
        title: 'Premium Pro',
        price: 'USD 19.99',
        description:
            'Unlock All our amazing features AI customizations to delicious recipes and meal plans',
        badge: 'Best Value',
        badgeColor: const Color(0xFF26CB63),
        icon: 'assets/svg images/flame.svg',
        features: [
          'Unlimited AI generated routines with adaptive feature and advanced personalization',
          'Mood & Energy Logging used for deep customization of routine',
          'To-do List & Short Term Goals with Smart Tracking and AI suggestions',
          'Custom AI workouts and progression tracking',
          'Premium Recipes and cooking plans',
          'Advanced Routine Customization and AI feedback',
          'Unlimited Review of Past Routines',
          'Smart Reminders based on habits',
          'Early Access to new features',
          'Priority Support',
        ],
        isPro: true,
        borderColor: getPremiumProBorderColor(),
      ),
      SubscriptionPlan(
        title: 'Premium',
        price: 'USD 9.99',
        description:
            'Unlock some of our great features including Basic Workouts and Unlimited AI routine generation!',
        badge: 'Good Value',
        badgeColor: const Color(0xFFFF9A0C),
        icon: 'assets/svg images/diamond.svg',
        features: [
          'Unlimited AI generated routines with adaptive feature',
          'Mood & Energy Logging used for routine adjustment',
          'To-do List & Short Term Goals with Smart Tracking',
          'Basic AI Workouts',
          'Basic Routine Customization',
          'Review Past Routines up to 7 days',
          'Motivational Reminders',
          'Priority Routine Access',
          'Faster Email Support',
        ],
        isPro: false,
        borderColor: getPremiumBorderColor(),
      ),
      SubscriptionPlan(
        title: 'Standard',
        price: 'Free',
        description:
            'Utilize our limited yet ample features in our standard package!',
        badge: 'Basic',
        badgeColor: const Color(0xFFE0E0E0),
        icon: null,
        features: [
          '1 AI generated routine per day',
          'Mood & Energy Logging',
          'To-do List & Short Term Goals',
        ],
        isPro: false,
        borderColor: getStandardBorderColor(),
      ),
    ];
  }
}
