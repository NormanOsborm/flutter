import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Gridviewwithsliversextent(),));
}
class Gridviewwithsliversextent extends StatefulWidget {
  const Gridviewwithsliversextent({super.key});

  @override
  State<Gridviewwithsliversextent> createState() =>
      _GridviewwithsliversextentState();
}

class _GridviewwithsliversextentState extends State<Gridviewwithsliversextent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children: [
          Container(
            child: Center(child: Text('1')),
            color: Colors.red,
          ),
          Container(
            child: Center(child: Text('2')),
            color: Colors.blue,
          ),
          Container(
            child: Center(child: Text('3')),
            color: Colors.yellow,
          ),
          Container(
            child: Center(child: Text('4')),
            color: Colors.green,
          ),
          Container(
            child: Center(child: Text('5')),
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
