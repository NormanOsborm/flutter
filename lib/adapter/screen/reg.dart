import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/Database.dart';
import '../model/usermodel.dart';
import 'log.dart';

void main() {
  runApp(
    const MaterialApp(home: Reg(), debugShowCheckedModeBanner: false),
  );
}

class Reg extends StatefulWidget {
  const Reg({super.key});

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/download (5).jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlurredBox(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: fullNameController,
                          label: "Full Name",
                          hint: "Full Name",
                          icon: Icons.person_add_alt_1,
                        ),
                        _buildTextField(
                          controller: emailController,
                          label: "Email",
                          hint: "Email",
                          icon: Icons.email,
                        ),
                        _buildTextField(
                          label: "Phone Number",
                          hint: "Phone Number",
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        _buildTextField(
                          controller: dobController,
                          label: "Date of Birth",
                          hint: "Date of Birth",
                          icon: Icons.cake,
                          keyboardType: TextInputType.datetime,
                        ),
                        _buildPasswordField(),
                        _buildConfirmPasswordField(),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            validateSignup();
                          },
                          child: const Text("Register"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextButton(
                    onPressed: () {
                      Get.to(const Log());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Already have an Account? Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateSignup() async {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final cpass = confirmPasswordC.text.trim();

    if (email.isEmpty || pass.isEmpty || cpass.isEmpty) {
      Get.snackbar("Error", "Fields cannot be empty");
      return;
    }

    if (!EmailValidator.validate(email)) {
      Get.snackbar("Error", "Please provide a valid email");
      return;
    }

    if (!checkPassword(pass, cpass)) {
      return;
    }

    final user = Master(email: email, password: pass);
    await DBFunction.instance.userSignup(user);
    Get.back();
    Get.snackbar("Success", "Account created successfully");
  }

  bool checkPassword(String pass, String cpass) {
    if (pass != cpass) {
      Get.snackbar("Error", "Passwords do not match");
      return false;
    } else if (pass.length < 6) {
      Get.snackbar("Error", "Password length should be at least 6 characters");
      return false;
    }
    return true;
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(icon, color: Colors.white),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: passwordController,
        obscureText: showPassword,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.white),
          labelText: "Password",
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: const Icon(Icons.lock, color: Colors.white),
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: confirmPasswordC,
        obscureText: showPassword,
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: const TextStyle(color: Colors.white),
          labelText: "Confirm Password",
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: const Icon(Icons.lock, color: Colors.white),
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class BlurredBox extends StatelessWidget {
  final Widget child;
  const BlurredBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 7,
                blurRadius: 1,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
