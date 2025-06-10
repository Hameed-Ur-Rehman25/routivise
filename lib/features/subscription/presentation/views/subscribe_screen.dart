// filepath: /Users/pc/Desktop/routivise/lib/features/subscription/presentation/views/subscribe_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/subscription_constants.dart';
import '../widgets/subscription_feature_list.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen>
    with TickerProviderStateMixin {
  int expandedIndex = -1;

  // Animation controllers for each subscription plan
  late AnimationController _premiumProAnimationController;
  late AnimationController _premiumAnimationController;
  late AnimationController _standardAnimationController;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    final animationDuration = const Duration(milliseconds: 300);

    _premiumProAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _premiumAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _standardAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
  }

  @override
  void dispose() {
    _premiumProAnimationController.dispose();
    _premiumAnimationController.dispose();
    _standardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(SubscriptionConstants.primaryPurpleStartValue),
              Color(SubscriptionConstants.primaryPurpleEndValue),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    const Text(
                      SubscriptionConstants.subscribeTitle,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    SubscriptionConstants.subscribeSubtitle,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset('assets/images/sub_screen_image.png', height: 120),
                const SizedBox(height: 24),
                _buildPlanCard(
                  index: 0,
                  title: SubscriptionConstants.premiumProLabel,
                  price: SubscriptionConstants.premiumProPrice,
                  description: SubscriptionConstants.premiumProDescription,
                  badge: SubscriptionConstants.bestValueLabel,
                  badgeColor: const Color(0xFF26CB63),
                  icon: 'assets/svg images/flame.svg',
                  features: SubscriptionConstants.premiumProFeatures,
                  isPro: true,
                ),
                const SizedBox(height: 16),
                _buildPlanCard(
                  index: 1,
                  title: SubscriptionConstants.premiumLabel,
                  price: SubscriptionConstants.premiumPrice,
                  description: SubscriptionConstants.premiumDescription,
                  badge: SubscriptionConstants.goodValueLabel,
                  badgeColor: const Color(0xFFFF9A0C),
                  icon: 'assets/svg images/diamond.svg',
                  features: SubscriptionConstants.premiumFeatures,
                  isPro: false,
                ),
                const SizedBox(height: 16),
                _buildPlanCard(
                  index: 2,
                  title: SubscriptionConstants.standardLabel,
                  price: SubscriptionConstants.standardPrice,
                  description: SubscriptionConstants.standardDescription,
                  badge: SubscriptionConstants.basicLabel,
                  badgeColor: const Color(0xFFE0E0E0),
                  icon: null,
                  features: SubscriptionConstants.standardFeatures,
                  isPro: false,
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Continue button action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(
                              SubscriptionConstants.primaryPurpleEndValue,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            SubscriptionConstants.continueLabel,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          SubscriptionConstants.skipForNowLabel,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        SubscriptionConstants.termsPrivacyLabel,
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required int index,
    required String title,
    required String price,
    required String description,
    required String badge,
    required Color badgeColor,
    String? icon,
    required List<String> features,
    required bool isPro,
  }) {
    final isExpanded = expandedIndex == index;

    // Get the appropriate animation controller based on the index
    AnimationController animationController;
    if (index == 0) {
      animationController = _premiumProAnimationController;
    } else if (index == 1) {
      animationController = _premiumAnimationController;
    } else {
      animationController = _standardAnimationController;
    }

    if (isExpanded && animationController.status != AnimationStatus.completed) {
      animationController.forward();
    } else if (!isExpanded &&
        animationController.status != AnimationStatus.dismissed) {
      animationController.reverse();
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final scale = isExpanded ? 1.02 : 1.0;

        return Transform.scale(
          scale: scale + (animationController.value * 0.02),
          child: child,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isPro
                    ? const Color(0xFFFF9A0C)
                    : (title == SubscriptionConstants.premiumLabel
                        ? const Color(0xFF1987DA)
                        : Colors.black),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.05 + (animationController.value * 0.08),
              ),
              blurRadius: 8 + (animationController.value * 6),
              spreadRadius: animationController.value * 2,
              offset: Offset(0, 4 - (animationController.value * 1)),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) SvgPicture.asset(icon, height: 28),
                if (icon != null) const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        badge == SubscriptionConstants.basicLabel
                            ? const Color(0xFF444444)
                            : badgeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Spacer(),
                if (price != SubscriptionConstants.standardPrice)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        SubscriptionConstants.buyNowButtonColorValue,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      SubscriptionConstants.buyNowLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color:
                  isPro
                      ? const Color(0xFFFF9A0C)
                      : (title == SubscriptionConstants.premiumLabel
                          ? const Color(0xFF1987DA)
                          : Colors.black),
              thickness: 1,
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  expandedIndex = isExpanded ? -1 : index;
                });
              },
              child: Row(
                children: [
                  const Text(
                    SubscriptionConstants.keyFeaturesLabel,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            SubscriptionFeatureList(
              features: features,
              animationController: animationController,
            ),
          ],
        ),
      ),
    );
  }
}
