import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterpro/hotelreg.dart';


void main() {
  runApp(MaterialApp(home: Hotelsplash(), debugShowCheckedModeBanner: false));
}

class Hotelsplash extends StatefulWidget {
  const Hotelsplash({super.key});

  @override
  State<Hotelsplash> createState() => _HotelsplashState();
}

class _HotelsplashState extends State<Hotelsplash> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Hotelreg()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/white.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/Boddha_transparent-.png"),
              height: 500,
              width: 500,
            ),
          ],
        ),
      ),
    );
  }
}
