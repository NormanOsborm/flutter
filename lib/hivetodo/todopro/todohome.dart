import 'package:flutter/material.dart';

class Todohome extends StatelessWidget {
  final String fullName;

  Todohome({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hi $fullName!",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
