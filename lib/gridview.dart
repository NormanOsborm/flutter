import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Gridview()));
// }

class Gridview extends StatefulWidget {
  const Gridview({super.key});

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5),
        children: [
          Container(
            child: Center(child: Text("BLAH")),
            color: Colors.redAccent,
          ),
          Container(
            child: Center(child: Text("BLAH")),
            color: Colors.yellowAccent,
          ),
          Container(
            child: Center(child: Text("BLAH")),
            color: Colors.greenAccent,
          ),
          Container(
            child: Center(child: Text("BLAH")),
            color: Colors.white24,
          ),
          Container(
            child: Center(child: Text("BLAH")),
            color: Colors.blueAccent,
          ),
          Container(
            child: Center(child: Text("BLAH")),
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
