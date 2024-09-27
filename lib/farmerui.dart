import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterpro/farmercont.dart';

void main() {
  runApp(MaterialApp(home: Farmerui(), debugShowCheckedModeBanner: false));
}

class Farmerui extends StatefulWidget {
  const Farmerui({super.key});

  @override
  State<Farmerui> createState() => _FarmeruiState();
}

class _FarmeruiState extends State<Farmerui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "FARMERS FRESH ZONE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            Icon(Icons.location_on, color: Colors.white),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Center(
                child: Text(
                  "Kochi",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 10.0),
            child: Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for vegetables and fruits...',
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Farmercont(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.greenAccent,
        showUnselectedLabels: true,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
