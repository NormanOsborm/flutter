import 'package:flutter/material.dart';
import 'package:flutterpro/hivetodo/todopro/todologin.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("todo_box");

  runApp(const MaterialApp(home: Todoreg()));
}

class Todoreg extends StatefulWidget {
  const Todoreg({super.key});

  @override
  _TodoregState createState() => _TodoregState();
}

class _TodoregState extends State<Todoreg> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();
  bool showpass = true;

  void createReg() async {
    var box = Hive.box('todo_box');
    String user = emailC.text;
    String pass = passwordC.text;
    String name = nameC.text;

    if (box.containsKey(user)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username already exists")),
      );
      return;
    }
    if (user.isNotEmpty && pass.isNotEmpty && name.isNotEmpty) {
      // Store a map with the user's details
      box.put(user, {'password': pass, 'name': name});
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Todologin()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1..jpeg"),
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
                  controller: nameC,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person_add_alt),
                  ),
                  validator: (name) => name == null || name.isEmpty ? "Enter your name" : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty || !email.contains('@') || !email.contains('.')) {
                      return "Enter a valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: passwordC,
                  obscureText: showpass,
                  obscuringCharacter: "+",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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
                  validator: (password) {
                    if (password == null || password.isEmpty || password.length < 6) {
                      return "Enter a valid password";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: confirmPasswordC,
                  obscureText: showpass,
                  obscuringCharacter: "+",
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
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
                    if (confirmPassword == null || confirmPassword.isEmpty || confirmPassword != passwordC.text) {
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
                  if (formkey.currentState!.validate()) {
                    createReg();
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
                      MaterialPageRoute(builder: (context) => const Todologin()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Already have an Account? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
