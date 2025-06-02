import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:routivise/features/subscription/domain/models/subscription_plan.dart';
import 'package:routivise/features/subscription/presentation/models/subscription_animation_config.dart';

/// Interface for subscription data operations
abstract class ISubscriptionRepository {
  /// Get animation durations for subscription cards
  Duration getAnimationDuration();

  /// Get animation curve for subscription cards
  Curve getAnimationCurve();

  /// Get complete animation configuration
  SubscriptionAnimationConfig getAnimationConfig();

  /// Get a list of all subscription plans
  List<SubscriptionPlan> getSubscriptionPlans();

  /// Get border color for Premium Pro plan
  Color getPremiumProBorderColor();

  /// Get border color for Premium plan
  Color getPremiumBorderColor();

  /// Get border color for Standard plan
  Color getStandardBorderColor();
}
