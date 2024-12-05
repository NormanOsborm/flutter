import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bodhalog.dart';

class Bodhahome extends StatefulWidget {
  final List<dynamic> name;
  const Bodhahome({Key? key, required this.name}) : super(key: key);

  @override
  State<Bodhahome> createState() => _BodhahomeState();
}

class _BodhahomeState extends State<Bodhahome> {
  @override
  Widget build(BuildContext context) {
    var userName = widget.name[0]['name'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Bodha-veg",
          style: GoogleFonts.aBeeZee(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [

            Center(child: Text("Hello $userName")),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Bodhalog(name: ''),
                ),
              ),
              icon: const Icon(IconlyBold.logout),
            ),
          ],
        ),
      ),
    );
  }
}
