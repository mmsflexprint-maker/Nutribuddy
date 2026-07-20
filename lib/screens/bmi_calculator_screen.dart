import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double bmi = 0;
  String result = "";

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double heightInMeters = height / 100;
      bmi = weight / (heightInMeters * heightInMeters);

      if (bmi < 18.5) {
        result = "Underweight";
      } else if (bmi < 25) {
        result = "Normal";
      } else if (bmi < 30) {
        result = "Overweight";
      } else {
        result = "Obese";
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.monitor_weight,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            const Text(
              "Calculate Your BMI",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (cm)",
                prefixIcon: const Icon(Icons.height),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
                prefixIcon: const Icon(Icons.scale),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: calculateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 18),
                ),
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

                    const Text(
                      "Your BMI",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      bmi == 0 ? "--" : bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      result,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [

                    Text(
                      "BMI Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text("Below 18.5  : Underweight"),

                    Text("18.5 - 24.9 : Normal"),

                    Text("25 - 29.9   : Overweight"),

                    Text("30 and above: Obese"),
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