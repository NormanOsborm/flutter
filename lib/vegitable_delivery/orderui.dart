import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterpro/vegitable_delivery/ordercont.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Orderui(),
    debugShowCheckedModeBanner: false,
  ));
}

class Orderui extends StatefulWidget {
  const Orderui({super.key});

  @override
  State<Orderui> createState() => _OrderuiState();
}

class _OrderuiState extends State<Orderui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Title Bar with Back Button and Orders Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconlyLight.arrowLeft2,
                          color: Colors.black,
                        ),
                        SizedBox(width: 3),
                        Text(
                          "Back",
                          style: GoogleFonts.overpass(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Orders",
                    style: GoogleFonts.overpass(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 6),
                ],
              ),
            ),
            Expanded(
              child: Ordercont(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true,
        currentIndex: 2,
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

// Example Widget from Another Dart File
class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Center(
        child: Text(
          'Content from Another Dart File',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
