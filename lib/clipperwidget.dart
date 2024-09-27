import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Clipperwidget(), debugShowCheckedModeBanner: false));
}

class Clipperwidget extends StatefulWidget {
  const Clipperwidget({super.key});

  @override
  State<Clipperwidget> createState() => _ClipperwidgetState();
}

class _ClipperwidgetState extends State<Clipperwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRect(
            child: Container(
              child: Image(
                image: AssetImage("assets/images/43921.jpg"),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              child: Image(
                image: AssetImage("assets/images/43890.jpg"),
              ),
            ),
          ),
          ClipOval(

            child: Container(
              child: Image(
                image: AssetImage("assets/images/1212254.jpg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
