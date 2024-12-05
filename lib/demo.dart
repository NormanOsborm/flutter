import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: BlurredBackground()),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/43890.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: BlurredBox(),
      ),
    );
  }
}

class BlurredBox extends StatelessWidget {
  const BlurredBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Blurred Box',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
