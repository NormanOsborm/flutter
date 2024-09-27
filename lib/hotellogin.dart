import 'package:flutter/material.dart';

import 'package:flutterpro/hotelreg.dart';
import 'package:flutterpro/hotelui.dart';


void main() {
  runApp(MaterialApp(home: Hotellogin(), debugShowCheckedModeBanner: false));
}

class Hotellogin extends StatefulWidget {
  const Hotellogin({super.key});

  @override
  State<Hotellogin> createState() => _HotelloginState();
}

class _HotelloginState extends State<Hotellogin> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); // Initializing form key
  bool showpass = true; // Initializing showpass variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white70,
        ),
        child: Form(
          key: formkey, // Using form key
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "Login Page",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Swami onn ninne....angane ang poyalo";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  obscureText: showpass, // Using showpass for toggling password visibility
                  obscuringCharacter: ",",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(showpass
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass; // Toggling showpass on icon press
                        });
                      },
                    ),
                  ),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Enter a valid password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black38,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  var valid = formkey.currentState!.validate();
                  if (valid) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelUI()));
                  }
                },
                child: const Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hotelreg()),
                    );
                  },
                  child: const Text("Don't have an account? Create one"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
