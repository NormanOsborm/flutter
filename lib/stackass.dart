import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

void main() {
  runApp(MaterialApp(home: Stackass(), debugShowCheckedModeBanner: false));
}

class Stackass extends StatefulWidget {
  const Stackass({super.key});

  @override
  State<Stackass> createState() => _StackassState();
}

class _StackassState extends State<Stackass> {
  int index = 0;
  var name = ["My Account", "Dashboard", "About", "Logout"];
  var icons = [
    Icon(Icons.person),
    Icon(Icons.dashboard),
    Icon(Icons.info),
    Icon(Icons.logout)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Color.alphaBlend(Colors.grey, Colors.white),
              height: double.infinity,
              width: double.infinity),
          Positioned(
            child: Container(
              height: 650,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
            left: 300,
            right: 300,
            top: 30,
          ),
          Positioned(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Color.alphaBlend(Colors.blueGrey, Colors.lightBlue),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            left: 300,
            right: 300,
            top: 1,

          ),
          Positioned(
            child: Column(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Edit Your Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 7.0,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            left: 330,
            right: 650,
            top: 90,
          ),
          Positioned(
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            left: 310,
            right: 700,
            top: 30,
          ),
          Positioned(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/7..jpg"),
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Harikrishnan.R',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            left: 300,
            right: 300,
            top: 160,
          ),


          Positioned(
            child: Container(
              width: 400,
              height: 200,
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(name[i]),
                      trailing: icons[i],
                    ),
                  );
                },
              ),
            ),
            top: 300,
            left: 300,
            right: 300,
          ),

          Positioned(
            top: 580,
            left: 300,
            right: 300,

            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: FlashyTabBar(
                selectedIndex: index,
                onItemSelected: (tapIndex) {
                  setState(() {
                    index = tapIndex;
                  });
                },
                items: [
                  FlashyTabBarItem(icon: Icon(Icons.home), title: Text("Home")),
                  FlashyTabBarItem(icon: Icon(Icons.search), title: Text("Search")),
                  FlashyTabBarItem(icon: Icon(Icons.pie_chart), title: Text("Graph")),
                  FlashyTabBarItem(icon: Icon(Icons.person), title: Text("Account")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
