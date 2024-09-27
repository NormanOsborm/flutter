import 'package:flutter/material.dart';
import 'package:flutterpro/Custom%20Widget/customswidget.dart';
void main(){
  runApp(MaterialApp(home: Custimple(),debugShowCheckedModeBanner: false,));
}
class Custimple extends StatelessWidget {
  const Custimple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Customswidget(card:Card(child: ,), title: null, subtitle: null, onpress: () {  },)

    );
  }
}
