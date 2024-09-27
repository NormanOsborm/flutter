 import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Gridviewcount(),));
}

class Gridviewcount extends StatefulWidget {
   const Gridviewcount({super.key});
 
   @override
   State<Gridviewcount> createState() => _GridviewcountState();
 }
 
 class _GridviewcountState extends State<Gridviewcount> {
   var color=[Colors.blue,Colors.lightBlue,Colors.redAccent,Colors.red,Colors.limeAccent,Colors.lime];
   var icons=[Icons.account_balance,Icons.add_alert,Icons.access_alarm_outlined,Icons.add_circle,Icons.ac_unit,Icons.insert_comment_rounded];
   var data=["Facebook","A10 NETWORKS ING.","Intel Corp","HP Inc","Advanced Micro Devices Inc","Apple Inc"];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body:GridView.count(crossAxisCount: 2,
        children: List.generate(icons.length, (index){
          return Card(color: color[index],
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icons[index]),
                Text(data[index])
              ],

            ),
          );
        }),),
      
      
     );
   }
 }
 