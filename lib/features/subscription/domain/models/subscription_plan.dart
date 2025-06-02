import 'package:flutter/material.dart';

/// Data model for subscription plans
class SubscriptionPlan {
  final String title;
  final String price;
  final String description;
  final String badge;
  final Color badgeColor;
  final String? icon;
  final List<String> features;
  final bool isPro;
  final Color borderColor;
  
  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.description,
    required this.badge,
    required this.badgeColor,
    this.icon,
    required this.features,
    required this.isPro,
    required this.borderColor,
  });
}
