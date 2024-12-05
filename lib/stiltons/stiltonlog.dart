import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterpro/stiltons/stiltonAdmin.dart';
import 'package:flutterpro/stiltons/stiltonhelper.dart';
import 'package:flutterpro/stiltons/stiltonhome.dart';
import 'package:flutterpro/stiltons/stiltonreg.dart';

void main() {
  runApp(const MaterialApp(home: Stiltonlog(), debugShowCheckedModeBanner: false));
}

class Stiltonlog extends StatefulWidget {
  const Stiltonlog({super.key});

  @override
  State<Stiltonlog> createState() => _StiltonlogState();
}

class _StiltonlogState extends State<Stiltonlog> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/download (7).jpeg"),
            fit: BoxFit.cover,
            opacity: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlurredBox(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Login", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      _buildTextField(
                        label: "Email",
                        hint: "Enter your email",
                        icon: Icons.email,
                        validator: (value) {
                          if (value == null || !value.contains('@') || !value.contains('.')) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      _buildPasswordField(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black12, foregroundColor: Colors.white),
                        onPressed: () async {
                          var valid = formkey.currentState!.validate();
                          if (valid) {
                            if (email.text == 'admin@gmail.com' && password.text == 'admin@123') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Welcome Admin!')),
                              );
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Stiltonadmin()));
                            } else {
                              var user = await StiltonHelper.userLogin(email.text);
                              if (user.isNotEmpty) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => Stiltonhome(name: user)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Email not registered. Please register first.")),
                                );
                              }
                            }
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Stiltonreg()),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  child: const Text("Not a user? Register here"),
                ),
              ),
            ],
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: email,
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
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 6) {
            return "Enter a valid password (min. 6 characters)";
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
