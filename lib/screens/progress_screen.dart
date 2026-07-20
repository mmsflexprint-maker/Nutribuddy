import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Progress"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.show_chart,
              size: 90,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            const Text(
              "Your Health Progress",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            progressCard(
              "Current Weight",
              "68 kg",
              Icons.monitor_weight,
              Colors.blue,
            ),

            progressCard(
              "BMI",
              "22.5",
              Icons.favorite,
              Colors.red,
            ),

            progressCard(
              "Water Intake",
              "7 / 8 Glasses",
              Icons.water_drop,
              Colors.lightBlue,
            ),

            progressCard(
              "Calories",
              "1650 / 2000 kcal",
              Icons.local_fire_department,
              Colors.orange,
            ),

            progressCard(
              "Exercise",
              "350 kcal Burned",
              Icons.fitness_center,
              Colors.green,
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: const [

                    Text(
                      "Achievements",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    ListTile(
                      leading: Icon(Icons.emoji_events,
                          color: Colors.amber),
                      title: Text("7-Day Healthy Streak"),
                    ),

                    ListTile(
                      leading: Icon(Icons.water_drop,
                          color: Colors.blue),
                      title: Text("100 Glasses of Water"),
                    ),

                    ListTile(
                      leading: Icon(Icons.local_fire_department,
                          color: Colors.orange),
                      title: Text("5000 Calories Burned"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget progressCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}