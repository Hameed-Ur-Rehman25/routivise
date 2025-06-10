/// Constants used across the subscription feature
class SubscriptionConstants {
  // Section titles
  static const String subscribeTitle = 'Subscribe Now!';
  static const String subscribeSubtitle =
      'Unlock all our incredible features to satisfy all your routine needs and much more!';

  // Plan types
  static const String premiumProLabel = 'Premium Pro';
  static const String premiumLabel = 'Premium';
  static const String standardLabel = 'Standard';

  // Button labels
  static const String chooseThisPlanLabel = 'Choose This Plan';
  static const String continueLabel = 'Continue';
  static const String skipForNowLabel = 'Skip for now';
  static const String buyNowLabel = 'Buy Now!';

  // Messaging
  static const String mostPopularLabel = 'Most Popular';
  static const String bestValueLabel = 'Best Value';
  static const String goodValueLabel = 'Good Value';
  static const String basicLabel = 'Basic';
  static const String keyFeaturesLabel = 'Key features';
  static const String termsPrivacyLabel =
      'By continuing, you agree to our Terms and Privacy Policy';

  // Plan descriptions
  static const String premiumProDescription =
      'Unlock All our amazing features AI customizations to delicious recipes and meal plans';
  static const String premiumDescription =
      'Unlock some of our great features including Basic Workouts and Unlimited AI routine generation!';
  static const String standardDescription =
      'Utilize our limited yet ample features in our standard package!';

  // Pricing
  static const String premiumProPrice = 'USD 19.99';
  static const String premiumPrice = 'USD 9.99';
  static const String standardPrice = 'Free';

  // Colors
  static const int primaryPurpleStartValue = 0xFF8B7AE9;
  static const int primaryPurpleEndValue = 0xFF304D96;
  static const int premiumProColorValue = 0xFFFCA964;
  static const int premiumColorValue = 0xFF8C85E9;
  static const int standardColorValue = 0xFF57ABFF;
  static const int inactiveColorValue = 0xFFE0E0E0;
  static const int buyNowButtonColorValue = 0xFFEF2424;

  // Common features
  static const List<String> standardFeatures = [
    '1 AI generated routine per day',
    'Mood & Energy Logging',
    'To-do List & Short Term Goals',
  ];

  static const List<String> premiumFeatures = [
    'Unlimited AI generated routines with adaptive feature',
    'Mood & Energy Logging used for routine adjustment',
    'To-do List & Short Term Goals with Smart Tracking',
    'Basic AI Workouts',
    'Basic Routine Customization',
    'Review Past Routines up to 7 days',
    'Motivational Reminders',
    'Priority Routine Access',
    'Faster Email Support',
  ];

  static const List<String> premiumProFeatures = [
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
  ];
}
