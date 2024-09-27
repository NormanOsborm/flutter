import 'package:flutter/material.dart';
import 'sampleui.dart';
import 'gridview.dart';
import 'seperated.dart';
import 'listviewbuilder.dart';
import 'simplecontact.dart';

import 'simplecontact.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Sampletab(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class Sampletab extends StatefulWidget {
  const Sampletab({super.key});

  @override
  State<Sampletab> createState() => _SampletabState();
}

class _SampletabState extends State<Sampletab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.black,
          dividerColor: Colors.white,
          indicatorColor: Colors.orangeAccent,
          unselectedLabelColor: Colors.deepPurple,
          tabs: [
            Tab(child: Icon(Icons.camera_alt)),
            Tab(child: Text("Chat")),
            Tab(child: Text("Status")),
            Tab(child: Text("Call")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SimpleContact()),
            );
          },
          child: Icon(Icons.message),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            Center(child: Icon(Icons.camera_alt)),
            Listviewbuilder(),
            Gridview(),
            SeparatedList(),

          ],
        ),
      ),
    );
  }
}
