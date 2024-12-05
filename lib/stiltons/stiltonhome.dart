import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterpro/stiltons/stiltonlog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Stiltonprofile.dart';
import 'dart:ui';

class Stiltonhome extends StatefulWidget {
  final List<dynamic> name;
  const Stiltonhome({Key? key, required this.name}) : super(key: key);

  @override
  State<Stiltonhome> createState() => _StiltonhomeState();
}

class _StiltonhomeState extends State<Stiltonhome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var userName = widget.name[0]['name'];
    bool isAdmin = userName.toLowerCase() == 'admin';

    final List<Widget> _pages = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlurredCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isAdmin ? "Halo $userName" : "Hello $userName",
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Stiltonlog(),
                      ),
                    ),
                    icon: const Icon(IconlyBold.logout, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Stiltonprofile(userData: widget.name[0], userId: widget.name[0]['id']),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/download (2).jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Page content
          _pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}


class BlurredCard extends StatelessWidget {
  final Widget child;
  const BlurredCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ),
    );
  }
}
