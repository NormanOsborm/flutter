import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterpro/bodha/bodhalog.dart';
import 'bodhahelper.dart';

class Bodhareg extends StatefulWidget {
  const Bodhareg({super.key});

  @override
  State<Bodhareg> createState() => _BodharegState();
}

class _BodharegState extends State<Bodhareg> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPass = true;
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/white.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
            key: formKey,
            child: Center(
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
                      controller: fullName,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.person_add_alt_1),
                      ),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.mail_outline),
                      ),
                      validator: (emailValue) {
                        if (emailValue!.isEmpty || !emailValue.contains('@') || !emailValue.contains('.')) {
                          return "Enter valid Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: TextFormField(
                      controller: password,
                      obscureText: showPass,
                      obscuringCharacter: "+",
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(showPass ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                        ),
                      ),
                      validator: (passwordValue) {
                        if (passwordValue!.isEmpty || passwordValue.length < 6) {
                          return "Enter a valid password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: TextFormField(
                      obscureText: showPass,
                      obscuringCharacter: "+",
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(showPass ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                        ),
                      ),
                      validator: (confirmPassword) {
                        if (confirmPassword!.isEmpty || confirmPassword.length < 6) {
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        int? userId = await BodhaHelper.createNewUser(email.text, password.text, fullName.text);
                        if (userId != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Bodhalog(name: fullName.text)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User already exists.")));
                        }
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
                          MaterialPageRoute(builder: (context) => const Bodhalog(name: '',)),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      child: const Text("Already have an Account..Then Login"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}