import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg3.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 80, top: 80),
              child: Text(
                "Login Page",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return TextField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                foregroundColor: Colors.red,
              ),
              onPressed: () {
                // Handle login logic
              },
              child: Text("Login"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: TextButton(
                onPressed: () {
                  // Handle account creation
                },
                child: Text("Not a user? Create an account..!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

