import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  String gender = "Male";
  String goal = "Maintain Weight";

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7F8),
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.green.shade100,
                  child: const Icon(
                    Icons.person_add,
                    size: 45,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Join NutriBuddy",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter your name" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter email" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) =>
                      value!.length < 6 ? "Minimum 6 characters" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(hideConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          hideConfirmPassword = !hideConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    prefixIcon: Icon(Icons.cake),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  value: gender,
                  decoration: const InputDecoration(
                    labelText: "Gender",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Male", child: Text("Male")),
                    DropdownMenuItem(value: "Female", child: Text("Female")),
                    DropdownMenuItem(value: "Other", child: Text("Other")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Height (cm)",
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Weight (kg)",
                    prefixIcon: Icon(Icons.monitor_weight),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  value: goal,
                  decoration: const InputDecoration(
                    labelText: "Health Goal",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: "Lose Weight",
                        child: Text("Lose Weight")),
                    DropdownMenuItem(
                        value: "Maintain Weight",
                        child: Text("Maintain Weight")),
                    DropdownMenuItem(
                        value: "Gain Muscle",
                        child: Text("Gain Muscle")),
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
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Account Created Successfully!"),
                          ),
                        );

                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}