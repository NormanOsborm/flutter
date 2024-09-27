import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Thakkalicont extends StatelessWidget {
  const Thakkalicont({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                "assets/images/tomato-1000x1000.jpg",
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Bangla Tomato",
              style: GoogleFonts.overpass(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Deshi Product",
              style: GoogleFonts.overpass(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.green, size: 18),
                Icon(Icons.star, color: Colors.green, size: 18),
                Icon(Icons.star, color: Colors.green, size: 18),
                Icon(Icons.star, color: Colors.green, size: 18),
                Icon(Icons.star_border, color: Colors.green, size: 18),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Decrease quantity
                      },
                      icon: Icon(Icons.remove, color: Colors.black),
                    ),
                    Text(
                      "1",
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        // Increase quantity
                      },
                      icon: Icon(Icons.add, color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  "\$7.90",
                  style: GoogleFonts.overpass(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "About the product",
              style: GoogleFonts.overpass(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Bangla tomatoes, a staple in Bengali cuisine, are renowned for their distinctive flavor and aroma. These tomatoes, often smaller and firmer than their Western counterparts, possess a unique sweetness and tanginess that sets them apart. Grown in the fertile lands of Bangladesh, Bangla tomatoes are cultivated using traditional farming methods, ensuring their authenticity and quality. One of the most striking features of Bangla tomatoes is their vibrant red color, which is a testament to their ripeness and freshness. The flesh is typically dense and juicy, with a slightly acidic taste that balances the sweetness. The tomatoes' unique flavor profile makes them an essential ingredient in a variety of Bengali dishes, from curries and chutneys to salads and soups.",
              style: GoogleFonts.overpass(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
