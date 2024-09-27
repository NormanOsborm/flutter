import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Gridviewextend(),));
}

class Gridviewextend extends StatefulWidget {
  const Gridviewextend({super.key});


  @override
  State<Gridviewextend> createState() => _GridviewextendState();
}

class _GridviewextendState extends State<Gridviewextend> {

  var color=[Colors.blue,Colors.lightBlue,Colors.redAccent,Colors.red,Colors.limeAccent,Colors.lime];
  var icons=[Icons.account_balance,Icons.add_alert,Icons.access_alarm_outlined,Icons.add_circle,Icons.ac_unit,Icons.insert_comment_rounded];
  var data=["Facebook","A10 NETWORKS ING.","Intel Corp","HP Inc","Advanced Micro Devices Inc","Apple Inc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body: GridView.extent(maxCrossAxisExtent: 100,
            children: List.generate(icons.length, (index){
              return Card(
                child: Column(
                  children: [
                    Icon(icons[index]),
                    Text(data[index])
                  ],
                ),
              );
            })),
        );
    }
}