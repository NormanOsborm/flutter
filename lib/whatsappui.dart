import 'package:flutter/material.dart';
import 'whatsappchats.dart';
import 'simplecontact.dart';

void main() {
  runApp(MaterialApp(
    home: Whatsappui(),
    debugShowCheckedModeBanner: false,
  ));
}

class Whatsappui extends StatefulWidget {
  const Whatsappui({super.key});

  @override
  State<Whatsappui> createState() => _WhatsappuiState();
}

class _WhatsappuiState extends State<Whatsappui> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "WhatsApp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(Icons.camera_alt_sharp),
          SizedBox(width: 26),
          Icon(Icons.qr_code_scanner),
          SizedBox(width: 36),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("New group")),
                PopupMenuItem(child: Text("New broadcast")),
                PopupMenuItem(child: Text("Linked devices")),
                PopupMenuItem(child: Text("Starred messages")),
                PopupMenuItem(child: Text("Payments")),
                PopupMenuItem(child: Text("Settings")),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: index,
        onTap: (tapIndex) {
          setState(() {
            index = tapIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_sharp),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
      body: content(index),
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
    );
  }


  Widget content(int index) {
    switch (index) {
      case 0:
        return Chats();
      case 1:
        return Center(child: Text('Updates', style: TextStyle(fontSize: 24)));
      case 2:
        return Center(child: Text('Communities', style: TextStyle(fontSize: 24)));
      case 3:
        return Center(child: Text('Calls', style: TextStyle(fontSize: 24)));
      default:
        return Center(child: Text('Page not found', style: TextStyle(fontSize: 24)));
    }
  }
}
