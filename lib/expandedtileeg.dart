import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: expandedtileeg(),));
}
class expandedtileeg extends StatefulWidget {
  const expandedtileeg({super.key});

  @override
  State<expandedtileeg> createState() => _expandedtileegState();
}

class _expandedtileegState extends State<expandedtileeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [ExpansionTile(
          backgroundColor: Colors.pink[600],
          title: Text("light colours"),
          children: [
            ListTile(leading: CircleAvatar(backgroundColor: Colors.red[100],),),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.yellow[100],),),
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.cyan[100],),),
          ],

        ),
          ExpansionTile(
            backgroundColor: Colors.pink[100], title: Text("dark colours"),
            children: [
              ListTile(leading: CircleAvatar(backgroundColor: Colors.red,),),
              ListTile(leading: CircleAvatar(backgroundColor: Colors.yellow,),),
              ListTile(leading: CircleAvatar(backgroundColor: Colors.cyan,),),
            ],)
        ],
      ),
    );
  }
}