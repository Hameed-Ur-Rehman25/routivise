import 'package:flutter/material.dart';
import 'package:routivise/features/subscription/domain/repositories/subscription_repository_interface.dart';
import 'package:routivise/features/subscription/data/repositories/subscription_repository.dart';
import 'package:routivise/features/subscription/presentation/models/subscription_animation_config.dart';

class SubscriptionCardAnimation {
  static final ISubscriptionRepository _repository = SubscriptionRepository();

  /// Controls the height animation of the subscription card when features expand
  static Animation<double> getHeightAnimation(
    AnimationController controller,
    double beginHeight,
    double endHeight,
  ) {
    return Tween<double>(begin: beginHeight, end: endHeight).animate(
      CurvedAnimation(
        parent: controller,
        curve: _repository.getAnimationCurve(),
      ),
    );
  }

  /// Creates a fade in animation for the feature list
  static Animation<double> getFadeAnimation(AnimationController controller) {
    return CurvedAnimation(
      parent: controller,
      curve: _repository.getAnimationCurve(),
    );
  }

  /// Gets scale animation with elastic effect
  static Animation<double> getScaleAnimation(
    AnimationController controller,
    bool isExpanded,
  ) {
    final config = _repository.getAnimationConfig();
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: config.collapsedScale,
          end: isExpanded ? config.expandedScale * 1.05 : config.collapsedScale,
        ),
        weight: 40.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin:
              isExpanded ? config.expandedScale * 1.05 : config.collapsedScale,
          end: isExpanded ? config.expandedScale : config.collapsedScale,
        ),
        weight: 60.0,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: config.scaleCurve));
  }

  /// Get animation duration from the repository
  static Duration getAnimationDuration() {
    return _repository.getAnimationDuration();
  }

  /// Get complete animation configuration
  static SubscriptionAnimationConfig getConfig() {
    return _repository.getAnimationConfig();
  }
}
