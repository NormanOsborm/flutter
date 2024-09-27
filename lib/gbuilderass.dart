import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(home: Gbuilderass()));
}

class Gbuilderass extends StatefulWidget {
  const Gbuilderass({super.key});

  @override
  State<Gbuilderass> createState() => _GbuilderassState();
}

class _GbuilderassState extends State<Gbuilderass> {
  var name = [
    "My Profile",
    "Book a Cab",
    "Booking Schedule",
    "Track Your Cab",
    "Help & Feedback",
    "Call to Transport",
    "Settings",
    "Log out"
  ];

  var icons = [
    Icons.person,
    FontAwesomeIcons.car,
    Icons.calendar_month,
    Icons.telegram,
    Icons.help,
    Icons.call,
    Icons.settings,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Menu")),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Center(
                          child: Icon(
                            icons[index], // Corrected here
                            color: Colors.yellow,
                            size: 50,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                    ),
                    Text(name[index]),
                  ],
                ),
              ),
            );
          },
          itemCount: name.length,
        ),
      ),
    );
  }
}
