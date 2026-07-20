import 'package:flutter/material.dart';
import '../services/api_service.dart';

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key});

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {

  bool isLoading = true;

  String aiDiet = "";

  Map? userData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    userData =
        ModalRoute.of(context)!.settings.arguments as Map;

    generateDiet();
  }

  Future<void> generateDiet() async {

    String prompt = """
You are an expert Indian nutritionist.

Create a personalized diet plan.

Name: ${userData!["name"]}
Age: ${userData!["age"]}
Gender: ${userData!["gender"]}
Height: ${userData!["height"]} cm
Weight: ${userData!["weight"]} kg
BMI: ${userData!["bmi"]}
Health Problem: ${userData!["healthProblem"]}
Food Preference: ${userData!["foodPreference"]}
Activity Level: ${userData!["activityLevel"]}
Goal: ${userData!["goal"]}

Return a beautiful plan including:

BMI Analysis

Daily Calories

Breakfast

Mid Morning Snack

Lunch

Evening Snack

Dinner

Water Intake

Exercise

Foods To Avoid

Healthy Tips
""";

    String response =
        await ApiService.askAI(prompt);

    setState(() {
      aiDiet = response;
      isLoading = false;
    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Your AI Diet Plan",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CircularProgressIndicator(),

                  SizedBox(height: 20),

                  Text(
                    "Creating your personalized diet plan...",
                    style: TextStyle(fontSize: 18),
                  ),

                ],
              ),
            )

          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets.all(20),

                      child: Column(
                        children: [

                          const Icon(
                            Icons.restaurant_menu,
                            size: 70,
                            color: Colors.green,
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "AI Personalized Diet Plan",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Text(
                            aiDiet,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                                    SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/chat',
                          arguments: userData,
                        );
                      },
                      icon: const Icon(
                        Icons.smart_toy,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Ask AI About My Diet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/dashboard',
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.home),
                      label: const Text(
                        "Back to Dashboard",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                                  ],
              ),
            ),
    );
  }
}