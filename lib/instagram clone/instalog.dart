import 'package:flutter/material.dart';
import 'package:flutterpro/instagram%20clone/instasign.dart';

void main() {
  runApp(MaterialApp(home: Instalog(), debugShowCheckedModeBanner: false));
}

class Instalog extends StatefulWidget {
  const Instalog({super.key});

  @override
  State<Instalog> createState() => _InstalogState();
}

class _InstalogState extends State<Instalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(
                        "assets/images/Instagram/Screenshot_2024-09-30_182009-removebg-preview.png"),
                    height: 100),

                SizedBox(height: 30),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone number, username, or email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 15),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ),
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Instasign()),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey.shade400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR',
                          style: TextStyle(color: Colors.grey.shade500)),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey.shade400),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.facebook, color: Colors.blue),
                  label: Text('Log in with Facebook',
                      style: TextStyle(color: Colors.deepPurple)),
                ),
                SizedBox(height: 15),

                // Forgot password
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?',
                      style: TextStyle(color: Colors.deepPurple)),
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Instasign()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
