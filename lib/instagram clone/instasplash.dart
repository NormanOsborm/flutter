import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterpro/instagram%20clone/instalog.dart';

void main() {
  runApp(MaterialApp(home: Instasplash(), debugShowCheckedModeBanner: false));
}

class Instasplash extends StatefulWidget {
  const Instasplash({super.key});

  @override
  State<Instasplash> createState() => _InstasplashState();
}

class _InstasplashState extends State<Instasplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Instalog()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Instagram/bfbfb.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Image(
              image: AssetImage(
                  "assets/images/Instagram/WhatsApp_Image_2024-09-30_at_18.11.04_f671abb7w-removebg-preview.png"),
              height: 300,
              width: 300,
            ),
            SizedBox(height: 50),
            Image(
              image: AssetImage(
                  "assets/images/Instagram/mret-removebg-preview.png"),
              height: 200,
              width: 200,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
