import 'package:flutter/material.dart';
import 'package:routivise/features/subscribe/data/repositories/subscription_repository.dart';
import 'package:routivise/features/subscribe/domain/models/subscription_plan.dart';
import 'package:routivise/features/subscribe/domain/repositories/subscription_repository_interface.dart';
import 'package:routivise/features/subscribe/presentation/models/subscription_animation_config.dart';

/// ViewModel for the subscription screen
class SubscriptionViewModel extends ChangeNotifier {
  final ISubscriptionRepository _repository = SubscriptionRepository();
  int _expandedIndex = -1;
  
  /// Current expanded card index (-1 means no card is expanded)
  int get expandedIndex => _expandedIndex;
  
  /// Set expanded card index
  void setExpandedIndex(int index) {
    _expandedIndex = (_expandedIndex == index) ? -1 : index;
    notifyListeners();
  }
  
  /// Get animation configuration
  SubscriptionAnimationConfig get animationConfig => _repository.getAnimationConfig();
  
  /// Get animation duration
  Duration get animationDuration => _repository.getAnimationDuration();
  
  /// Check if a card is expanded
  bool isCardExpanded(int index) => _expandedIndex == index;
  
  /// Get all subscription plans
  List<SubscriptionPlan> get subscriptionPlans => _repository.getSubscriptionPlans();
  
  /// Get border color for a subscription plan
  Color getBorderColor(String title) {
    switch (title) {
      case 'Premium Pro':
        return _repository.getPremiumProBorderColor();
      case 'Premium':
        return _repository.getPremiumBorderColor();
      default:
        return _repository.getStandardBorderColor();
    }
  }
}
