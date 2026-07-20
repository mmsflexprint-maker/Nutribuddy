import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/bmi_calculator_screen.dart';
import 'screens/calorie_tracker_screen.dart';
import 'screens/water_tracker_screen.dart';
import 'screens/meal_planner_screen.dart';
import 'screens/exercise_screen.dart';
import 'screens/ai_chat_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/diet_plan_screen.dart';
import 'screens/health_assessment_screen.dart';

void main() {
  runApp(const NutriBuddy());
}

class NutriBuddy extends StatelessWidget {
  const NutriBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriBuddy',

      // First screen
      initialRoute: '/welcome',

      routes: {
        '/welcome': (context) => const WelcomeScreen(),

        '/login': (context) => const LoginScreen(),

        '/signup': (context) => const SignupScreen(),

        '/health': (context) => HealthAssessmentScreen(),

        '/diet': (context) => const DietPlanScreen(),

        '/dashboard': (context) => const DashboardScreen(),

        '/bmi': (context) => const BMICalculatorScreen(),

        '/calorie': (context) => const CalorieTrackerScreen(),

        '/water': (context) => const WaterTrackerScreen(
              glasses: 0,
            ),

        '/meal': (context) => const MealPlannerScreen(),

        '/exercise': (context) => const ExerciseScreen(),

        '/chat': (context) => const AIChatScreen(),

        '/progress': (context) => const ProgressScreen(),

        '/profile': (context) => const ProfileScreen(),

        '/settings': (context) => const SettingsScreen(),

        

        
      },
    );
  }
}