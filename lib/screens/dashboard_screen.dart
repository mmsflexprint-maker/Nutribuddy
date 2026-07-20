import 'package:flutter/material.dart';

import 'meal_planner_screen.dart';
import 'water_tracker_screen.dart';
import 'bmi_calculator_screen.dart';
import 'calorie_tracker_screen.dart';
import 'exercise_screen.dart';
import 'ai_chat_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int glasses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "NutriBuddy",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Stay healthy with NutriBuddy",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            buildCard(
              Icons.local_fire_department,
              "Calories",
              "1450 / 2000 kcal",
              Colors.orange,
            ),

            const SizedBox(height: 15),

            buildCard(
              Icons.water_drop,
              "Water Intake",
              "$glasses / 8 Glasses",
              Colors.blue,
            ),

            const SizedBox(height: 15),

            buildCard(
              Icons.monitor_weight,
              "BMI",
              "22.4 (Healthy)",
              Colors.green,
            ),

            const SizedBox(height: 25),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.1,

              children: [                actionCard(
                  context,
                  Icons.restaurant,
                  "Meal Planner",
                  const MealPlannerScreen(),
                ),

                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaterTrackerScreen(
                          glasses: glasses,
                        ),
                      ),
                    );

                    if (result != null && result is int) {
                      setState(() {
                        glasses = result;
                      });
                    }
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop,
                          size: 45,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Water Tracker",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                actionCard(
                  context,
                  Icons.calculate,
                  "BMI Calculator",
                  const BMICalculatorScreen(),
                ),

                actionCard(
                  context,
                  Icons.local_fire_department,
                  "Calorie Tracker",
                  const CalorieTrackerScreen(),
                ),

                actionCard(
                  context,
                  Icons.fitness_center,
                  "Exercise",
                  const ExerciseScreen(),
                ),

                actionCard(
                  context,
                  Icons.chat,
                  "AI Assistant",
                  const AIChatScreen(),
                ),

                actionCard(
                  context,
                  Icons.show_chart,
                  "Progress",
                  const ProgressScreen(),
                ),

                actionCard(
                  context,
                  Icons.person,
                  "Profile",
                  const ProfileScreen(),
                ),

                actionCard(
                  context,
                  Icons.settings,
                  "Settings",
                  const SettingsScreen(),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "AI",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],

        onTap: (index) {
          switch (index) {
            case 0:
              break;

            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProgressScreen(),
                ),
              );
              break;

            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AIChatScreen(),
                ),
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Widget buildCard(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }  Widget actionCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 45,
              color: Colors.green,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}