import 'package:flutter/material.dart';

class CalorieTrackerScreen extends StatefulWidget {
  const CalorieTrackerScreen({super.key});

  @override
  State<CalorieTrackerScreen> createState() =>
      _CalorieTrackerScreenState();
}

class _CalorieTrackerScreenState extends State<CalorieTrackerScreen> {
  int calorieGoal = 2000;
  int consumedCalories = 0;

  @override
  Widget build(BuildContext context) {
    int remainingCalories = calorieGoal - consumedCalories;
    double progress = consumedCalories / calorieGoal;

    if (progress > 1) {
      progress = 1;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Calorie Tracker"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.local_fire_department,
              size: 100,
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            const Text(
              "Daily Calorie Tracker",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [

                    Text(
                      "$consumedCalories / $calorieGoal kcal",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),

                    const SizedBox(height: 20),

                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 12,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.orange,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "${(progress * 100).toInt()}% Completed",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.flag,
                  color: Colors.green,
                ),
                title: const Text("Daily Goal"),
                trailing: Text(
                  "$calorieGoal kcal",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.restaurant,
                  color: Colors.orange,
                ),
                title: const Text("Consumed"),
                trailing: Text(
                  "$consumedCalories kcal",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
                title: const Text("Remaining"),
                trailing: Text(
                  "$remainingCalories kcal",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (consumedCalories >= 100) {
                        consumedCalories -= 100;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text("Remove 100"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 55),
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      consumedCalories += 100;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add 100"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 55),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: const [

                    Text(
                      "Healthy Tips",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text("🥗 Eat more vegetables"),

                    SizedBox(height: 10),

                    Text("🍎 Choose healthy snacks"),

                    SizedBox(height: 10),

                    Text("💧 Drink plenty of water"),

                    SizedBox(height: 10),

                    Text("🏃 Exercise every day"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}