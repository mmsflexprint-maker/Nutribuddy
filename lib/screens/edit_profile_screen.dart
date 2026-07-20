import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, String> profileData;

  const EditProfileScreen({
    super.key,
    required this.profileData,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController ageController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController goalController;
  late TextEditingController activityController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.profileData["name"]);

    emailController =
        TextEditingController(text: widget.profileData["email"]);

    ageController =
        TextEditingController(text: widget.profileData["age"]);

    heightController =
        TextEditingController(text: widget.profileData["height"]);

    weightController =
        TextEditingController(text: widget.profileData["weight"]);

    goalController =
        TextEditingController(text: widget.profileData["goal"]);

    activityController =
        TextEditingController(text: widget.profileData["activity"]);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    goalController.dispose();
    activityController.dispose();
    super.dispose();
  }

  Widget buildField(String label, TextEditingController controller,
      {TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(Icons.edit),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            buildField("Name", nameController),

            buildField(
              "Email",
              emailController,
              keyboard: TextInputType.emailAddress,
            ),

            buildField(
              "Age",
              ageController,
              keyboard: TextInputType.number,
            ),

            buildField(
              "Height (cm)",
              heightController,
              keyboard: TextInputType.number,
            ),

            buildField(
              "Weight (kg)",
              weightController,
              keyboard: TextInputType.number,
            ),

            buildField("Goal", goalController),

            buildField("Activity", activityController),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {

                  Navigator.pop(context, {

                    "name": nameController.text,

                    "email": emailController.text,

                    "age": ageController.text,

                    "height": heightController.text,

                    "weight": weightController.text,

                    "goal": goalController.text,

                    "activity": activityController.text,

                  });

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}