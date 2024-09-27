//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'package:flutterpro/hotellogin.dart';
//import 'package:flutterpro/loginpage_withvalidation.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Hotelreg(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class Hotelreg extends StatefulWidget {
  const Hotelreg({super.key});

  @override
  State<Hotelreg> createState() => _HotelregState();
}

class _HotelregState extends State<Hotelreg> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showpass = true;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/white.png"),
          fit: BoxFit.cover,
        )),
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
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 30,left: 70,right: 70),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Full Name",
                  labelText: "Enter your Full name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),

                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (name) {
                  if (name!.isEmpty){
                    return "Swami onn ninne....angane ang poyalo";
                  }else {
                    return null;
                  }
                },
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "'",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Enter a Strong password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
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
                      return "correct ayi enter cheyy mwonu";
                    } else {
                      password = passwordValue;
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: ",",
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    labelText: "Confirm Your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
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
                  validator: (confirmPassword) {
                    if (confirmPassword!.isEmpty || confirmPassword.length < 6) {
                      return "valid password ideda manda";
                    }
                    if (confirmPassword != password) {
                      return "Molil type cheythath thanne type cheyyada"; // Validation for confirming password
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.black38,
                ),
                onPressed: () {
                  var valid = formkey.currentState!.validate();
                  if (valid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hotellogin()),
                    );
                  }
                },
                child: Text("Register"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hotellogin()),
                    );
                  },
                  child: Text("Already have an Account..Then Login"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black38,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
