import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: stackeg(),));
}
class stackeg extends StatefulWidget {
  const stackeg({super.key});

  @override
  State<stackeg> createState() => _stackegState();
}

class _stackegState extends State<stackeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [Container(color: Colors.yellow[100],height: double.infinity,width: double.infinity,),
              Positioned(child: Container(color: Colors.red[100],height: 300,width: 400,),left: 60,top: 100,),
              Positioned(child: Container(color: Colors.green[100],),height: 100,width: 100,left: 150,top: 50,),
            ],
            ),
        );
    }
}