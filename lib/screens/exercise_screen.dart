import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int caloriesBurned = 0;

  void addCalories(int calories) {
    setState(() {
      caloriesBurned += calories;
    });
  }

  Widget exerciseCard(
      String exercise,
      IconData icon,
      int calories,
      Color color,
      ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          exercise,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("$calories kcal / 30 min"),
        trailing: ElevatedButton(
          onPressed: () {
            addCalories(calories);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
          ),
          child: const Text("Add"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Exercise Tracker"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.fitness_center,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 15),

            const Text(
              "Today's Exercise",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green.shade50,
              child: ListTile(
                leading: const Icon(
                  Icons.local_fire_department,
                  color: Colors.orange,
                ),
                title: const Text("Calories Burned"),
                trailing: Text(
                  "$caloriesBurned kcal",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  exerciseCard(
                    "Walking",
                    Icons.directions_walk,
                    120,
                    Colors.blue,
                  ),

                  exerciseCard(
                    "Running",
                    Icons.directions_run,
                    300,
                    Colors.red,
                  ),

                  exerciseCard(
                    "Cycling",
                    Icons.pedal_bike,
                    250,
                    Colors.orange,
                  ),

                  exerciseCard(
                    "Yoga",
                    Icons.self_improvement,
                    100,
                    Colors.purple,
                  ),

                  exerciseCard(
                    "Gym Workout",
                    Icons.fitness_center,
                    350,
                    Colors.green,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}