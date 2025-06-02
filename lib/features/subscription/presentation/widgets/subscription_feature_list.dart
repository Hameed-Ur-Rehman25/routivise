import 'package:flutter/material.dart';

/// Widget to display the feature list in subscription cards
class SubscriptionFeatureList extends StatelessWidget {
  /// List of features to display
  final List<String> features;
  
  /// Animation controller for animated effects
  final AnimationController animationController;
  
  const SubscriptionFeatureList({
    Key? key,
    required this.features,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Align(
            heightFactor: animationController.value,
            child: Opacity(
              opacity: animationController.value,
              child: child,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: features.map((f) => _buildFeatureItem(f)).toList(),
          ),
        ),
      ),
    );
  }
  
  /// Builds individual feature item with check icon and text
  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              feature, 
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
