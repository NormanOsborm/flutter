import 'package:flutter/material.dart';

class Customswidget extends StatelessWidget {
  final Card card;
  final Text title;
  final Text? subtitle;
  final Icon? iconss;

  VoidCallback onpress;

  Customswidget(
      {required this.card,
        required this.title,
        required this.subtitle,
        required this.onpress,
        this.iconss});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(child:card ,)
      ],)
    );
  }
}
