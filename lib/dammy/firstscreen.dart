import 'package:flutter/material.dart';
import 'package:flutterpro/dammy/dammyproduct.dart';
import 'package:flutterpro/dammy/secondscreen.dart';
void main(){
  runApp(MaterialApp(home: Firstscreen(),routes: {'secondscreen':(context)=>Secondscreen(),}));
}

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:dammyproduct.map((product) =>
          GestureDetector(
            child: Column(
              children: [
                Image(image:AssetImage(product["image"])),
                Text(product["name"]),
              ],
            ),
            onTap: ()=>getProduct(context,product["id"]),
          )).toList()


      ),
    );
  }
  void getProduct(BuildContext context,product){
    Navigator.pushNamed(context, "secondscreen", arguments: product);
  }
}
