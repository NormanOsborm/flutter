import 'package:flutter/material.dart';
import 'package:flutterpro/sharedprefferences/registrationpagescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepagescreen.dart';

void main() {
  runApp(MaterialApp(
    home: SharedPreferenceseg(),
    debugShowCheckedModeBanner: false,
  ));
}

class SharedPreferenceseg extends StatefulWidget {
  @override
  State<SharedPreferenceseg> createState() => _SharedPreferencesegState();
}

class _SharedPreferencesegState extends State<SharedPreferenceseg> {
  late SharedPreferences data;
  late bool newuser;
  late String regname;
  late String reguname;
  late String regpass;


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showpass = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkLogin();
    getuser();
  }
  void getuser() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      regname = data.getString("name") ?? "Guest";
      reguname = data.getString("username") ?? "";
      regpass = data.getString("password") ?? "";
    });
  }

  void checkLogin() async {
    data = await SharedPreferences.getInstance();
    newuser = (data.getBool("newuser") ?? true);

    if (newuser == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepagescreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences Example"),
      ),
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
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (username) {
                    if (username!.isEmpty ||
                        !username.contains('@') ||
                        !username.contains('.')) {
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
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                          showpass ? Icons.visibility_off : Icons.visibility),
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
                    } else {
                      return null;
                    }
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
                  if (formkey.currentState!.validate()) {
                    var user = username.text;
                    var pass = password.text;

                    if (user != '' && pass != '' && user==reguname && pass==regpass)
                    {
                      print("Login successful");
                      data.setString("username", user);
                      data.setString("name", regname);

                      // Save to SharedPreferences
                      data = await SharedPreferences.getInstance();
                      data.setString('username', user);
                      data.setBool('newuser', false);

                      // Navigate to Home Page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepagescreen()),
                      );
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
                      MaterialPageRoute(
                          builder: (context) => Registrationpagescreen()),
                    );
                  },
                  child: const Text("Don't have an account? Create one"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
