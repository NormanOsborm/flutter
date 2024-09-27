import 'package:flutter/material.dart';
import 'package:flutterpro/clipperwidget.dart';
import 'package:flutterpro/Custom%20Widget/customwidget.dart';
void main(){
  runApp(MaterialApp(home: Customwidgeteg(),debugShowCheckedModeBanner: false,));
}
class Customwidgeteg extends StatelessWidget {
  const Customwidgeteg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Customwidget(img: Image(image: AssetImage("assets/images/file1.png"),),title: Text("blah blah"),subtitle: Text("Blaaaah blah"),onpress: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Clipperwidget()));
        },),
      ),
    );
  }
}
