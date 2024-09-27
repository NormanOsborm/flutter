import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'sampletab.dart';

void main() {
  runApp(MaterialApp(home: Sampleui(), debugShowCheckedModeBanner: false));
}

class Sampleui extends StatefulWidget {
  const Sampleui({super.key});

  @override
  State<Sampleui> createState() => _SampleuiState();
}

class _SampleuiState extends State<Sampleui> {
  int index = 0;
  var screen=[
    Sampletab(),
    Text("data"),
    Text("data"),
    Text("data"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Ahaaa!!"),
      ),
      body: screen[index],
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

      bottomNavigationBar: FlashyTabBar(
        selectedIndex: index,
        onItemSelected: (tapIndex) {
          setState(() {
            if (tapIndex == 3) {
              show(context);
            } else {
              index = tapIndex;
            }
          });
        },
        items: [
          FlashyTabBarItem(icon: Icon(Icons.home), title: Text("Home")),
          FlashyTabBarItem(icon: Icon(Icons.message), title: Text("Chat")),
          FlashyTabBarItem(icon: Icon(Icons.call), title: Text("Call")),
          FlashyTabBarItem(icon: Icon(Icons.contact_page), title: Text("Contact")),
        ],
      ),
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: const [
            ListTile(
              title: Text("data1"),
              subtitle: Text("data2"),
            ),
            ListTile(
              title: Text("data1"),
              subtitle: Text("data2"),
            ),
            ListTile(
              title: Text("data1"),
              subtitle: Text("data2"),
            ),
          ],
        );
      },

    );
  }
}
