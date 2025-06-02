import 'package:flutter/material.dart';

/// Configuration model for subscription card animations
class SubscriptionAnimationConfig {
  final Duration duration;
  final Curve curve;
  final double expandedScale;
  final double collapsedScale;
  final Curve scaleCurve;
  
  const SubscriptionAnimationConfig({
    required this.duration,
    required this.curve,
    required this.expandedScale,
    required this.collapsedScale,
    required this.scaleCurve,
  });
  
  /// Default configuration for subscription card animations
  factory SubscriptionAnimationConfig.defaultConfig() {
    return const SubscriptionAnimationConfig(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      expandedScale: 1.02,
      collapsedScale: 1.0,
      scaleCurve: Curves.elasticOut,
    );
  }
}
