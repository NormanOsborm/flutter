import 'package:flutter/material.dart';
import 'package:flutterpro/bodha/Bodhadmin.dart';
import 'package:flutterpro/bodha/bodhahome.dart';
import 'bodhahelper.dart';
import 'bodhareg.dart';

class Bodhalog extends StatefulWidget {
  const Bodhalog({super.key, required String name});

  @override
  State<Bodhalog> createState() => _BodhalogState();
}

class _BodhalogState extends State<Bodhalog> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
            key: formkey,
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(
                      "Login Page",
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
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.person_add_alt),
                      ),
                      validator: (username) {
                        if (username == null ||
                            !username.contains('@') ||
                            !username.contains('.')) {
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
                      obscureText: showpass,
                      obscuringCharacter: "M",
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(showpass ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              showpass = !showpass;
                            });
                          },
                        ),
                      ),
                      validator: (pass) {
                        if (pass == null || pass.length < 6) {
                          return "Enter valid password";
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
                      var valid = formkey.currentState!.validate();
                      if (valid) {
                        // Check if admin credentials
                        if (email.text == 'admin@gmail.com' &&
                            password.text == 'admin@123') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Welcome Admin!')),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Bodhadmin(),
                            ),
                          );
                        }
                      
                        else {
                          var user = await BodhaHelper.loginUser(email.text);
                          if (user.isNotEmpty) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bodhahome(name: user),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Email not registered!")),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Bodhareg(),
                              ),
                            );
                          }
                        }
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
                          MaterialPageRoute(builder: (context) => const Bodhareg()),
                        );
                      },
                      child: const Text("Don't Have an account? Create one",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
