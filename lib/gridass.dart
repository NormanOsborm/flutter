import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(home: Gridass()));
}

class Gridass extends StatefulWidget {
  const Gridass({super.key});

  @override
  State<Gridass> createState() => _GridassState();
}

class _GridassState extends State<Gridass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Builder"),
        backgroundColor: Colors.blueAccent,
        leading: Icon(Icons.arrow_back),
      ),
      body: GridView( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15),
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.car),
                Text("Car"),
              ],
            ),
            color: Colors.greenAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.bicycle),
                Text("Bicycle"),
              ],
            ),
            color: Colors.pink,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.sailboat),
                Text("Boat"),
              ],
            ),
            color: Colors.pinkAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.bus),
                Text("Bus"),
              ],
            ),
            color: Colors.green,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.train),
                Text("Train"),
              ],
            ),
            color: Colors.greenAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_walk),
                Text("Walk"),
              ],
            ),
            color: Colors.yellowAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.contact_phone),
                Text("Contact"),
              ],
            ),
            color: Colors.grey,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.duo),
                Text("Duo"),
              ],
            ),
            color: Colors.greenAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hourglass_bottom),
                Text("hour"),
              ],
            ),
            color: Colors.pinkAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.mobile),
                Text("mobile"),
              ],
            ),
            color: Colors.blueGrey,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message),
                Text("message"),
              ],
            ),
            color: Colors.green,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.key),
                Text("key"),
              ],
            ),
            color: Colors.lightGreen,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi),
                Text("Wifi"),
              ],
            ),
            color: Colors.lightGreenAccent,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bluetooth),
                Text("Bluetooth"),
              ],
            ),
            color: Colors.lightBlue,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.faceSmile),
                Text("Smile"),
              ],
            ),
            color: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}
