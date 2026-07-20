import 'package:flutter/material.dart';

class MealPlannerScreen extends StatelessWidget {
  const MealPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Meal Planner"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add Meal feature coming soon!"),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Today's Meals",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Track your meals and calories.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            mealCard(
              icon: Icons.free_breakfast,
              title: "Breakfast",
              meal: "Oats + Banana + Milk",
              calories: "350 kcal",
              color: Colors.orange,
            ),

            const SizedBox(height: 15),

            mealCard(
              icon: Icons.lunch_dining,
              title: "Lunch",
              meal: "Rice + Dal + Salad",
              calories: "600 kcal",
              color: Colors.green,
            ),

            const SizedBox(height: 15),

            mealCard(
              icon: Icons.apple,
              title: "Snacks",
              meal: "Apple + Almonds",
              calories: "180 kcal",
              color: Colors.red,
            ),

            const SizedBox(height: 15),

            mealCard(
              icon: Icons.dinner_dining,
              title: "Dinner",
              meal: "Chapati + Paneer + Vegetables",
              calories: "500 kcal",
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [

                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.orange,
                      size: 40,
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Today's Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "1630 / 2000 kcal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget mealCard({
    required IconData icon,
    required String title,
    required String meal,
    required String calories,
    required Color color,
  }) {
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
            fontSize: 18,
          ),
        ),

        subtitle: Text(
          "$meal\nCalories: $calories",
        ),

        isThreeLine: true,

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}