import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Drawereg(), debugShowCheckedModeBanner: false));
}

class Drawereg extends StatefulWidget {
  const Drawereg({super.key});

  @override
  State<Drawereg> createState() => _DraweregState();
}

class _DraweregState extends State<Drawereg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text("Drawer"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black38,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Hary"),
              accountEmail: const Text("Harry@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/2..jpeg"),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/download (3).jpeg"),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/6..jpeg"),
                ),
              ],
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            const ListTile(
              leading: Icon(Icons.update),
              title: Text("Update"),
            ),
            const ListTile(
              leading: Icon(Icons.send),
              title: Text("Send"),
            ),
            const ListTile(
              leading: Icon(Icons.drafts),
              title: Text("Drafts"),
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Show"),
      ),
    );
  }
}
