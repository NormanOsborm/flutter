import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterpro/stiltons/stiltonhelper.dart';
import 'package:flutterpro/stiltons/stiltonlog.dart';

void main() {
  runApp(
    const MaterialApp(home: Stiltonreg(), debugShowCheckedModeBanner: false),
  );
}

class Stiltonreg extends StatefulWidget {
  const Stiltonreg({super.key});

  @override
  State<Stiltonreg> createState() => _StiltonregState();
}

class _StiltonregState extends State<Stiltonreg> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showpass = true;


  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();

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
                    key: formkey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: fullname,
                          label: "Full Name",
                          hint: "Full Name",
                          icon: Icons.person_add_alt_1,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return "Enter your name";
                            }
                            return null;
                          },
                        ),

                        _buildTextField(
                          controller: email,
                          label: "Email",
                          hint: "Email",
                          icon: Icons.email,
                          validator: (email) {
                            if (email == null || !email.contains('@') || !email.contains('.')) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          label: "Phone Number",
                          hint: "Phone Number",
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          validator: (phone) {
                            if (phone == null || phone.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(phone)) {
                              return "Enter a valid 10-digit phone number";
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          controller: dob,
                          label: "Date of Birth",
                          hint: "Date of Birth",
                          icon: Icons.cake,
                          keyboardType: TextInputType.datetime,
                          validator: (dobValue) {
                            if (dobValue == null || dobValue.isEmpty) {
                              return "Enter your date of birth";
                            }
                            return null;
                          },
                        ),
                        _buildPasswordField(),
                        _buildConfirmPasswordField(),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              int? userId = await StiltonHelper.existingUser(
                                email.text,
                                fullname.text,
                                dob.text,
                                password.text,
                              );
                              if (userId != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Stiltonlog(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("User already exists")),
                                );
                              }
                            }
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Stiltonlog(),
                        ),
                      );
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

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(icon),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: password,
        obscureText: showpass,
        obscuringCharacter: "+",
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: const TextStyle(color: Colors.white),
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(showpass ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                showpass = !showpass;
              });
            },
          ),
        ),
        validator: (passwordValue) {
          if (passwordValue == null || passwordValue.length < 6) {
            return "Enter a valid password (min. 6 characters)";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: showpass,
        obscuringCharacter: "+",
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: const TextStyle(color: Colors.white),
          labelText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(showpass ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                showpass = !showpass;
              });
            },
          ),
        ),
        validator: (confirmPassword) {
          if (confirmPassword == null || confirmPassword.length < 6) {
            return "Enter a valid password (min. 6 characters)";
          }
          if (confirmPassword != password.text) {
            return "Passwords do not match";
          }
          return null;
        },
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
