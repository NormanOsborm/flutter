import 'package:flutter/material.dart';

import 'gridview.dart';
import 'seperated.dart';
import 'listviewbuilder.dart';
import 'simplecontact.dart';

void main() {
  runApp(MaterialApp(home: Tabbareg(), debugShowCheckedModeBanner: false));
}

class Tabbareg extends StatefulWidget {
  const Tabbareg({super.key});

  @override
  State<Tabbareg> createState() => _TabbaregState();
}

class _TabbaregState extends State<Tabbareg> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("WhatsApp",),
          actions: [
            Icon(Icons.search),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("Invite")),
                  PopupMenuItem(child: Text("Refresh")),
                  PopupMenuItem(child: Text("Logout")),
                ];
              },
            ),
          ],
          bottom: TabBar(
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
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            TabBarView(
              children: [
                Center(child: Icon(Icons.camera_alt)),
                Listviewbuilder(),
                Gridview(),
                SeparatedList(),
              ],
            ),
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
      ),
    );
  }
}
