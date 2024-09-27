import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'simplecontact.dart';

void main() {
  runApp(MaterialApp(home: Bottomnavigation(), debugShowCheckedModeBanner: false));
}

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int index = 1;
  var screen = [
    Text("profile"),
    Text("chat"),
    Text("call"),
    Text("contact")
  ];

  void _handleIndexChanged(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WHACHAP", style: TextStyle(color: Colors.black38)),
        backgroundColor: Colors.black12,
        actions: [
          Icon(Icons.search),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("blah", style: TextStyle(color: Colors.black38))),
                PopupMenuItem(child: Text("blah", style: TextStyle(color: Colors.black38))),
                PopupMenuItem(child: Text("blah", style: TextStyle(color: Colors.black38))),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: index,
          height: 60,
          unselectedItemColor: Colors.black38,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.black12,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.message,
              unselectedIcon: IconlyLight.message,
              selectedColor: Colors.black12,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.call,
              unselectedIcon: IconlyLight.call,
              selectedColor: Colors.black12,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user,
              selectedColor: Colors.black12,
            ),
          ],
        ),
      ),
      body: Center(child: screen[index]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SimpleContact()),
          );
        },
        child: Icon(Icons.message),
        backgroundColor: Colors.black38,
        foregroundColor: Colors.black12,
      ),
    );
  }
}
