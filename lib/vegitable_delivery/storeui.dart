import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'storecont.dart';

void main() {
  runApp(MaterialApp(home: Storeui(), debugShowCheckedModeBanner: false));
}

class Storeui extends StatefulWidget {
  const Storeui({super.key});

  @override
  State<Storeui> createState() => _StoreuiState();
}

class _StoreuiState extends State<Storeui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Store",
            style: GoogleFonts.overpass(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          actions: [
            Icon(IconlyLight.buy, color: Colors.black),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
            ),
          ],
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 10.0),
            child: Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Search for Products',
                  suffixStyle: GoogleFonts.abel(fontSize: 15),
                  prefixIcon: Icon(IconlyLight.search, color: Colors.black),
                  suffixIcon: Icon(
                    IconlyLight.filter,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
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
                  backgroundImage:
                      AssetImage("assets/images/download (3).jpeg"),
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
      body: Storecont(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.grid),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.bell),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.envelope_paper),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
