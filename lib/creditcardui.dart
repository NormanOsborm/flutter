import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: CreditCardUI(),
    debugShowCheckedModeBanner: false,
  ));
}

class CreditCardUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 350,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/Carbon Fiber Background With Red Lights, Wallpaper, Frame, Weave Background Image And Wallpaper for Free Download.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 240,
              child: Text(
                'CSB Bank',
                style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 20,
              child:Image.asset("assets/images/chip.png",height: 40,width: 30,) ,
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Text(
                '6522 3200 2345 9876',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 120,
              child: Text(
                'Valid\nThru',
                style: GoogleFonts.overpass(
                  color: Colors.white70,
                  fontSize: 6,
                ),
              ),
            ),
            Positioned(
              top: 135,
              left: 140,
              child: Text(
                '08/23',
                style: GoogleFonts.orbitron(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Text(
                'VINAYAK HEGDE',
                style: GoogleFonts.orbitron(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 180,
              bottom: 20,
              right: 20,
              child: Image.asset("assets/images/download.png",height: 90,width: 90,),
            ),
            Positioned(
              top: 70,
              right: 20,
              child: Icon(
                Icons.wifi,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
