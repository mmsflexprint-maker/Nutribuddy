import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4CAF50),
              Color(0xFF81C784),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(
                  Icons.health_and_safety_rounded,
                  size: 130,
                  color: Colors.white,
                ),

                const SizedBox(height: 30),

                const Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "NutriBuddy AI",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Your Personal AI Nutrition Assistant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "✓ Personalized Diet Plans\n"
                  "✓ AI Nutrition Chat\n"
                  "✓ BMI Calculator\n"
                  "✓ Water Tracker\n"
                  "✓ Calorie Tracker\n"
                  "✓ Exercise Planner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 70),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Eat Healthy • Live Better",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}