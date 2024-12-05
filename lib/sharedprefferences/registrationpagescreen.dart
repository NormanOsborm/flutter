import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpagescreen.dart';

void main() {
  runApp(MaterialApp(
    home: Registrationpagescreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class Registrationpagescreen extends StatefulWidget {
  @override
  State<Registrationpagescreen> createState() => _RegistrationpagescreenState();
}

class _RegistrationpagescreenState extends State<Registrationpagescreen> {
  late SharedPreferences data;
  late bool newuser;
  TextEditingController fname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showpass = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg3.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: fname,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    labelText: "Full name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person_add_alt_1),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person_2),
                  ),
                  validator: (email) {
                    if (email!.isEmpty ||
                        !email.contains('@') ||
                        !email.contains('.')) {
                      return "Enter valid Email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: password,
                  obscureText: showpass,
                  obscuringCharacter: "+",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(showpass == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                    ),
                  ),
                  validator: (passwordValue) {
                    if (passwordValue!.isEmpty || passwordValue.length < 6) {
                      return "Enter a valid password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "+",
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(showpass == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                    ),
                  ),
                  validator: (confirmPassword) {
                    if (confirmPassword!.isEmpty ||
                        confirmPassword.length < 6) {
                      return "Enter a valid password";
                    }
                    if (confirmPassword != password.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  var valid = formkey.currentState!.validate();
                  if (valid) {
                    register();
                  }
                },
                child: const Text("Register"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SharedPreferenceseg()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Already have an Account..Then Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    data = await SharedPreferences.getInstance();
    String name = fname.text;
    String uname = username.text;
    String psw = password.text;
    if (uname.isNotEmpty && psw.isNotEmpty) {
      data.setString("name", name);
      data.setString("username", uname);
      data.setString("password", psw);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SharedPreferenceseg()));
    }
  }
}
