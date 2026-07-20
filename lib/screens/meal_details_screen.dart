import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Meal Details"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.orange.shade100,
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 55,
                  color: Colors.orange,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Center(
              child: Text(
                "Breakfast",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                "Oats + Banana + Milk",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 30),

            nutritionCard("Calories", "350 kcal", Icons.local_fire_department, Colors.orange),
            const SizedBox(height: 15),

            nutritionCard("Protein", "18 g", Icons.fitness_center, Colors.blue),
            const SizedBox(height: 15),

            nutritionCard("Carbohydrates", "45 g", Icons.grain, Colors.green),
            const SizedBox(height: 15),

            nutritionCard("Fat", "8 g", Icons.opacity, Colors.red),

            const SizedBox(height: 30),

            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "• Oats\n"
                  "• Banana\n"
                  "• Low-fat Milk\n"
                  "• Honey\n"
                  "• Chia Seeds",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Recipe",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "1. Add oats to a bowl.\n\n"
                  "2. Pour warm milk.\n\n"
                  "3. Slice banana.\n\n"
                  "4. Add honey and chia seeds.\n\n"
                  "5. Mix well and enjoy.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  "Back",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget nutritionCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      elevation: 4,
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
        trailing: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}