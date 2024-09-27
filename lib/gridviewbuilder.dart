import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Gridviewbuilder()));
}
class Gridviewbuilder extends StatefulWidget {
  const Gridviewbuilder({super.key});

  @override
  State<Gridviewbuilder> createState() => _GridviewbuilderState();
}

class _GridviewbuilderState extends State<Gridviewbuilder> {
  var color=[Colors.blue,Colors.lightBlue,Colors.redAccent,Colors.red,Colors.limeAccent,Colors.lime];
  var icons=[Icons.account_balance,Icons.add_alert,Icons.access_alarm_outlined,Icons.add_circle,Icons.ac_unit,Icons.insert_comment_rounded];
  var data=["Facebook","A10 NETWORKS ING.","Intel Corp","HP Inc","Advanced Micro Devices Inc","Apple Inc"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10
  ),
  itemBuilder: (context,index){
    return Container(color: color[index],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons[index]),
        Text(data[index]),
      ],
    ),
    );
  },itemCount: data.length,
  ),

    );
  }
}
