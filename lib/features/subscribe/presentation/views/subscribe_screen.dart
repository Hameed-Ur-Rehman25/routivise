import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routivise/features/subscribe/presentation/animations/subscription_card_animation.dart';
import 'package:routivise/features/subscribe/presentation/widgets/subscription_feature_list.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> with TickerProviderStateMixin {
  int expandedIndex = -1;
  
  // Animation controllers for each subscription plan
  late AnimationController _premiumProAnimationController;
  late AnimationController _premiumAnimationController;
  late AnimationController _standardAnimationController;
  
  @override
  void initState() {
    super.initState();
    
    // Get animation duration from SubscriptionCardAnimation
    final animationDuration = SubscriptionCardAnimation.getAnimationDuration();
    
    // Initialize animation controllers with the duration from repository
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
            colors: [Color(0xFF8B7AE9), Color(0xFF304D96)],
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
                    Spacer(flex: 2,),
                    const Text(
                      'Subscribe Now!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(width: 5,)
                  ],
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Unlock all our incredible features to satisfy all your routine needs and much more!',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset(
                  'assets/images/sub_screen_image.png',
                  height: 120,
                ),
                const SizedBox(height: 24),
                _buildPlanCard(
                  index: 0,
                  title: 'Premium Pro',
                  price: 'USD 19.99',
                  description: 'Unlock All our amazing features AI customizations to delicious recipes and meal plans',
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
                ),
                const SizedBox(height: 16),
                _buildPlanCard(
                  index: 1,
                  title: 'Premium',
                  price: 'USD 9.99',
                  description: 'Unlock some of our great features including Basic Workouts and Unlimited AI routine generation!',
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
                ),
                const SizedBox(height: 16),
                _buildPlanCard(
                  index: 2,
                  title: 'Standard',
                  price: 'Free',
                  description: 'Utilize our limited yet ample features in our standard package!',
                  badge: 'Basic',
                  badgeColor: const Color(0xFFE0E0E0),
                  icon: null,
                  features: [
                    '1 AI generated routine per day',
                    'Mood & Energy Logging',
                    'To-do List & Short Term Goals',
                  ],
                  isPro: false,
                ),
                const SizedBox(height: 32),
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
    } else if (!isExpanded && animationController.status != AnimationStatus.dismissed) {
      animationController.reverse();
    }
    
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        // Use our custom spring scale animation
        final scale = isExpanded 
            ? SubscriptionCardAnimation.getConfig().expandedScale 
            : SubscriptionCardAnimation.getConfig().collapsedScale;
        
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
            color: isPro ? const Color(0xFFFF9A0C) : (title == 'Premium' ? const Color(0xFF1987DA) : Colors.black),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05 + (animationController.value * 0.08)),
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
                if (icon != null)
                  SvgPicture.asset(icon, height: 28),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: badge == 'Basic' ? const Color(0xFF444444) : badgeColor,
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
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                if (price != 'Free')
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF2424),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Buy Now!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: isPro ? const Color(0xFFFF9A0C) : (title == 'Premium' ? const Color(0xFF1987DA) : Colors.black),
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
                    'Key features',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down_rounded, size: 28),
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
