import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: Gridviewcustom()));
}

class Gridviewcustom extends StatefulWidget {
  const Gridviewcustom({super.key});

  @override
  State<Gridviewcustom> createState() => _GridviewcustomState();
}

class _GridviewcustomState extends State<Gridviewcustom> {
  var color = [Colors.yellow, Colors.red, Colors.green, Colors.purple];
  var iconss = [
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarm_rounded,
    Icons.add_circle,
  ];
  var data = [
    "account_balance",
    "add_alert",
    "access_alarm_rounded",
    "add_circle"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
        ),
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconss[index],
                    color: color[index],
                    size: 50,
                  ),
                  Text(
                    data[index],
                    style: GoogleFonts.abrilFatface(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: iconss.length, // Number of items in the grid
        ),
      ),
    );
  }
}
