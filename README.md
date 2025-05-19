# 🧠 AI-Powered Customised Daily Routines App - Routivise

A cross-platform mobile app built with Flutter (or FlutterFlow), designed to optimize daily productivity, fitness, and self-care routines using personalized AI-generated schedules. Powered by GPT-4, Firebase, and Stripe/RevenueCat, this app adapts to user behavior and preferences in real-time.

## 🚀 Features

- 📅 **AI-Generated Daily Routines**: Automatically planned schedules integrating work, fitness, meals, and self-care based on user preferences.
- 😊 **Mood & Energy Tracking**: Log your daily mental and physical state to dynamically adjust routines.
- 🏋️ **Workout Planner**: Customized workouts based on your fitness goals and level.
- ✅ **Goals & To-Do Lists**: Create and manage short-term goals and daily tasks.
- 🍳 **Premium Cooking Area**: AI-suggested healthy recipes and meal plans (subscription required).
- 🔒 **Secure Authentication**: Sign up/login via Firebase using email/password or Google.
- 💳 **Subscription System**: Stripe or RevenueCat integration for premium content access.
- 📱 **Responsive & Beautiful UI**: Built with Flutter with a smooth and intuitive user experience.

---

## 📲 Pages Overview

| Page                      | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| **1. Splash Screen**       | Animated branding with gradient background. Transitions to onboarding/login. |
| **2. Onboarding Flow**     | Collects user data: name, work hours, fitness level, goals, preferences.     |
| **3. Authentication Page** | Firebase auth with secure password toggle and Google login.                 |
| **4. Home Dashboard**      | AI-generated routine view with mood/energy sliders and regenerate button.   |
| **5. Workout Planner**     | Personalized workout routines with check-off functionality.                 |
| **6. Goals & To-Do Page**  | Manage and track personal goals and tasks integrated with the main routine. |
| **7. Cooking Area**        | Premium recipes and meal plans (locked until subscription is active).       |
| **8. Subscription Page**   | Plan details with Stripe or RevenueCat-based subscription options.          |
| **9. Mood & Energy Page**  | Sliders and emojis to log current state affecting next-day routine.         |
| **10. Profile/Settings**   | Manage preferences, account info, notifications, and subscriptions.         |
| **11. Empty/Error States** | Friendly fallback screens for offline, empty, or error scenarios.           |

---

## 🛠️ Tech Stack

- **Frontend**: Flutter 
- **Backend**: Firebase (Auth, Firestore, Functions, Storage)  
- **AI Integration**: OpenAI GPT-4 API  
- **Payments & Subscriptions**: Stripe 
- **State Management**: Riverpod 

---

## 🔧 Installation

1. **Clone the Repository**
   
