import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpro/media%20query/resposnive.dart';

class Right extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Resposnive.isWeb(context)? double.infinity:100,
      color: Colors.black12,
      child: Image.asset("assets/images/bg3.jpg",fit: BoxFit.cover,),
      

    );
  }
}
