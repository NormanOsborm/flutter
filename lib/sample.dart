import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Sample(),
  ));
}

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "blah blah",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"),fit: BoxFit.fill),),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/file.png"),height: 400,width: 400,),
              // Text(
              //   "Text",
              //   style: TextStyle(
              //     fontSize: 40,
              //     fontWeight: FontWeight.w600,
              //     fontStyle: FontStyle.normal,
              //   ),
              // ),
            ],
          ),
        ),
      );
  }
}
