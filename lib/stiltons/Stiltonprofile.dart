import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpro/stiltons/stiltonhelper.dart';

class Stiltonprofile extends StatefulWidget {
  final Map<String, dynamic> userData;
  final int userId;
  const Stiltonprofile({super.key, required this.userData, required this.userId});

  @override
  State<Stiltonprofile> createState() => _StiltonprofileState();
}

class _StiltonprofileState extends State<Stiltonprofile> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.userData['email']);
    nameController = TextEditingController(text: widget.userData['name']);
    dobController = TextEditingController(text: widget.userData['dob']);
    passwordController = TextEditingController(text: widget.userData['pass']);
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    dobController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField("Name", nameController),
                _buildTextField("Email", emailController),
                _buildTextField("Date of Birth", dobController),
                _buildTextField("Password", passwordController, obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {

                    await StiltonHelper.updateUser(
                      widget.userId,
                      nameController.text,
                      emailController.text,
                      dobController.text,
                      passwordController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile updated successfully")),
                    );
                  },
                  child: const Text("Save Changes"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
