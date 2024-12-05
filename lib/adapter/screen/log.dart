import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterpro/adapter/screen/reg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../database/Database.dart';
import '../model/usermodel.dart';
import 'homeee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MasterAdapter());
  Hive.openBox<Master>('users');
  runApp(const GetMaterialApp(
    home: Log(),
  ));
}

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        label: "Email",
                        hint: "Enter your email",
                        icon: Icons.email,
                      ),
                      _buildPasswordField(),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black12,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final userlist = await DBFunction.instance.getUser();
                          await findUser(userlist);
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
                    Get.to(const Reg());
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
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
        validator: (value) {
          if (value == null || !value.contains('@') || !value.contains('.')) {
            return "Enter a valid email";
          }
          return null;
        },
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
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 6) {
            return "Enter a valid password (min. 6 characters)";
          }
          return null;
        },
      ),
    );
  }

  Future<void> findUser(List<Master> userlist) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    bool userFound = false;

    final validate = await validateLogin(email, password);
    if (validate == true) {
      await Future.forEach (userlist,(user) {
        if (user.email == email && user.password == password) {
          userFound = true;
          return 0;
        }
      });

      if (userFound) {
        Get.offAll(() => Homeee(email: email));
        Get.snackbar("Success", "Login Successful", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Error", "Incorrect email or password", backgroundColor: Colors.red);
      }
    }
  }

  Future<bool> validateLogin(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    } else {
      Get.snackbar("Error", "Fields cannot be empty", backgroundColor: Colors.redAccent);
      return false;
    }
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
