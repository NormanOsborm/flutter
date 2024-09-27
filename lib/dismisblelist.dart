import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Dismisblelist(),debugShowCheckedModeBanner: false));
}
class Dismisblelist extends StatefulWidget {
  const Dismisblelist({super.key});

  @override
  State<Dismisblelist> createState() => _DismisblelistState();
}

class _DismisblelistState extends State<Dismisblelist> {
  var date = ["date1", "date2", "date3", "date4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return Dismissible(background:Container(color: Colors.limeAccent),key: ValueKey(date),secondaryBackground:Container(color: Colors.orangeAccent),
            child: Container(color:Colors.red,child: Text(date[index])));
      },itemCount: date.length,),
    );
  }
}
