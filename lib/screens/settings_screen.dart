import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 50,
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "App Settings",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: const Text("Notifications"),
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              trailing: const Text("English"),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text("Privacy"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.description),
              title: const Text("Terms & Conditions"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Rate App"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {},
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
    );
  }
}