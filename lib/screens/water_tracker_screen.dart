import 'package:flutter/material.dart';

class WaterTrackerScreen extends StatefulWidget {
  final int glasses;

  const WaterTrackerScreen({
    super.key,
    required this.glasses,
  });

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  late int glasses;

  final int goal = 8;

  @override
  void initState() {
    super.initState();
    glasses = widget.glasses;
  }

  @override
  Widget build(BuildContext context) {
    double progress = glasses / goal;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, glasses);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),

        appBar: AppBar(
          title: const Text("Water Tracker"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, glasses);
            },
          ),
        ),        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              const Icon(
                Icons.water_drop,
                size: 100,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                "Today's Water Intake",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "$glasses / $goal Glasses",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 20),

              LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.grey,
                color: Colors.blue,
              ),

              const SizedBox(height: 10),

              Text(
                "${(progress * 100).toInt()}% Completed",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (glasses > 0) {
                          glasses--;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text("Remove"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 55),
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (glasses < goal) {
                          glasses++;
                        }
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 55),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 40),              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [

                      Text(
                        "Hydration Tips",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(height: 15),

                      Text("💧 Drink a glass of water after waking up"),

                      SizedBox(height: 10),

                      Text("🥗 Drink water before every meal"),

                      SizedBox(height: 10),

                      Text("🏃 Stay hydrated during exercise"),

                      SizedBox(height: 10),

                      Text("🚰 Carry a water bottle wherever you go"),

                    ],
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Return updated water intake to Dashboard
                    Navigator.pop(context, glasses);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Save & Return",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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