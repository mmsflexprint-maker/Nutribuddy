import 'package:flutter/material.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _formKey = GlobalKey<FormState>();

  final mealNameController = TextEditingController();
  final caloriesController = TextEditingController();
  final proteinController = TextEditingController();
  final carbsController = TextEditingController();
  final fatController = TextEditingController();

  String mealType = "Breakfast";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Meal"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5F7FA),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,
          child: Column(
            children: [

              const Icon(
                Icons.restaurant_menu,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: mealNameController,
                decoration: const InputDecoration(
                  labelText: "Meal Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fastfood),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter meal name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: mealType,
                decoration: const InputDecoration(
                  labelText: "Meal Type",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Breakfast",
                    child: Text("Breakfast"),
                  ),
                  DropdownMenuItem(
                    value: "Lunch",
                    child: Text("Lunch"),
                  ),
                  DropdownMenuItem(
                    value: "Snacks",
                    child: Text("Snacks"),
                  ),
                  DropdownMenuItem(
                    value: "Dinner",
                    child: Text("Dinner"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    mealType = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: caloriesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Calories",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_fire_department),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: proteinController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Protein (g)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fitness_center),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: carbsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Carbohydrates (g)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.grain),
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: fatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Fat (g)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.opacity),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text(
                    "Save Meal",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${mealNameController.text} added successfully!",
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}