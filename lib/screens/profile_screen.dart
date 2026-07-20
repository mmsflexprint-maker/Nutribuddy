import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Map<String, String> profileData = {
    "name": "John Doe",
    "email": "john@example.com",
    "age": "22 Years",
    "height": "175 cm",
    "weight": "68 kg",
    "goal": "Weight Loss",
    "activity": "Moderate",
  };

  Future<void> openEditProfile() async {

    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          profileData: profileData,
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        profileData = Map<String, String>.from(updatedData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              profileData["name"]!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              profileData["email"]!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            profileCard(
              Icons.cake,
              "Age",
              profileData["age"]!,
            ),

            profileCard(
              Icons.height,
              "Height",
              profileData["height"]!,
            ),

            profileCard(
              Icons.monitor_weight,
              "Weight",
              profileData["weight"]!,
            ),

            profileCard(
              Icons.flag,
              "Goal",
              profileData["goal"]!,
            ),

            profileCard(
              Icons.fitness_center,
              "Activity",
              profileData["activity"]!,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(

                onPressed: openEditProfile,

                icon: const Icon(Icons.edit),

                label: const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 15),
                        SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
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
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}