import 'package:flutter/material.dart';
import 'package:flutterpro/hivetodo/todopro/todohome.dart';
import 'package:hive/hive.dart';

class Todologin extends StatefulWidget {
  const Todologin({super.key});

  @override
  State<Todologin> createState() => _TodologinState();
}

class _TodologinState extends State<Todologin> {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  bool showpass = true;

  void loginUser() async {
    var box = Hive.box('todo_box');
    String user = emailC.text;
    String password = passC.text;

    if (box.containsKey(user)) {
      var userData = box.get(user);
      String storedPassword = userData['password'];

      if (storedPassword == password) {
        // Retrieve the name from userData
        String name = userData['name'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Todohome(fullName: name),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Check your email and password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
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
                  "Login Page",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person_add_alt),
                  ),
                  validator: (username) {
                    if (username!.isEmpty || !username.contains('@') || !username.contains('.')) {
                      return "Enter valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: passC,
                  obscureText: showpass,
                  obscuringCharacter: "+",
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
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Enter a valid password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    loginUser();
                  }
                },
                child: const Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("New User? Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
