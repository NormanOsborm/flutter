import 'package:flutter/material.dart';

class Customwidget extends StatelessWidget {
  final Image img;
  final Text title;
  final Text? subtitle;
  final Icon? iconss;
  VoidCallback onpress;

  Customwidget(
      {required this.img,
      required this.title,
      required this.subtitle,
      required this.onpress,
      this.iconss});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: ListTile(
          leading: img,
          title: title,
          subtitle: subtitle,
          trailing: iconss,
          onTap: onpress,
        ),
      ),
    );
  }
}
