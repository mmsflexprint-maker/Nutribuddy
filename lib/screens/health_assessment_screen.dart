import 'package:flutter/material.dart';

class HealthAssessmentScreen extends StatefulWidget {
  const HealthAssessmentScreen({super.key});

  @override
  State<HealthAssessmentScreen> createState() =>
      _HealthAssessmentScreenState();
}

class _HealthAssessmentScreenState
    extends State<HealthAssessmentScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController ageController =
      TextEditingController();

  final TextEditingController heightController =
      TextEditingController();

  final TextEditingController weightController =
      TextEditingController();

  String gender = "Male";

  String healthProblem = "Healthy Lifestyle";

  String foodPreference = "Vegetarian";

  String activityLevel = "Moderate";

  String goal = "Maintain Weight";
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Health Assessment",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Tell us about yourself",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "We'll create a personalized AI diet plan for you.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Height (cm)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Weight (kg)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
              ),

              const SizedBox(height: 25),
                            // Gender
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Male",
                    child: Text("Male"),
                  ),
                  DropdownMenuItem(
                    value: "Female",
                    child: Text("Female"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Health Problem
              DropdownButtonFormField<String>(
                value: healthProblem,
                decoration: const InputDecoration(
                  labelText: "Current Health Problem",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.health_and_safety),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Healthy Lifestyle",
                    child: Text("Healthy Lifestyle"),
                  ),
                  DropdownMenuItem(
                    value: "Weight Loss",
                    child: Text("Weight Loss"),
                  ),
                  DropdownMenuItem(
                    value: "Weight Gain",
                    child: Text("Weight Gain"),
                  ),
                  DropdownMenuItem(
                    value: "Diabetes",
                    child: Text("Diabetes"),
                  ),
                  DropdownMenuItem(
                    value: "High Blood Pressure",
                    child: Text("High Blood Pressure"),
                  ),
                  DropdownMenuItem(
                    value: "Thyroid",
                    child: Text("Thyroid"),
                  ),
                  DropdownMenuItem(
                    value: "PCOS",
                    child: Text("PCOS"),
                  ),
                  DropdownMenuItem(
                    value: "Heart Disease",
                    child: Text("Heart Disease"),
                  ),
                  DropdownMenuItem(
                    value: "Kidney Disease",
                    child: Text("Kidney Disease"),
                  ),
                  DropdownMenuItem(
                    value: "Digestive Problems",
                    child: Text("Digestive Problems"),
                  ),
                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    healthProblem = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Food Preference
              DropdownButtonFormField<String>(
                value: foodPreference,
                decoration: const InputDecoration(
                  labelText: "Food Preference",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.restaurant),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Vegetarian",
                    child: Text("Vegetarian"),
                  ),
                  DropdownMenuItem(
                    value: "Non-Vegetarian",
                    child: Text("Non-Vegetarian"),
                  ),
                  DropdownMenuItem(
                    value: "Vegan",
                    child: Text("Vegan"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    foodPreference = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Activity Level
              DropdownButtonFormField<String>(
                value: activityLevel,
                decoration: const InputDecoration(
                  labelText: "Activity Level",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_run),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Low",
                    child: Text("Low"),
                  ),
                  DropdownMenuItem(
                    value: "Moderate",
                    child: Text("Moderate"),
                  ),
                  DropdownMenuItem(
                    value: "High",
                    child: Text("High"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    activityLevel = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Goal
              DropdownButtonFormField<String>(
                value: goal,
                decoration: const InputDecoration(
                  labelText: "Goal",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flag),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Lose Weight",
                    child: Text("Lose Weight"),
                  ),
                  DropdownMenuItem(
                    value: "Maintain Weight",
                    child: Text("Maintain Weight"),
                  ),
                  DropdownMenuItem(
                    value: "Gain Weight",
                    child: Text("Gain Weight"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    goal = value!;
                  });
                },
              ),

              const SizedBox(height: 30),
                            SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {

                    if (nameController.text.isEmpty ||
                        ageController.text.isEmpty ||
                        heightController.text.isEmpty ||
                        weightController.text.isEmpty) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please fill all the fields.",
                          ),
                        ),
                      );

                      return;
                    }

                    double height =
                        double.parse(heightController.text);

                    double weight =
                        double.parse(weightController.text);

                    double bmi =
                        weight / ((height / 100) * (height / 100));

                    Navigator.pushNamed(
                      context,
                      '/diet',
                      arguments: {
                        "name": nameController.text,
                        "age": ageController.text,
                        "gender": gender,
                        "height": heightController.text,
                        "weight": weightController.text,
                        "healthProblem": healthProblem,
                        "foodPreference": foodPreference,
                        "activityLevel": activityLevel,
                        "goal": goal,
                        "bmi": bmi.toStringAsFixed(1),
                      },
                    );
                  },
                  child: const Text(
                    "Generate My AI Diet Plan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
                          ],
          ),
        ),
      ),
    );
  }
}