import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Listcustomlistdeligate()));
}

class Listcustomlistdeligate extends StatelessWidget {
  var name = [
    "noeal mwonue",
    "reehul mwonu",
    "ottamind",
    "njan",
    "blah",
    "vlah"
  ];
  var phone = ["blah", "blah", "blah", "blah", "blah", "blah"];
  var image = [
    "assets/images/bg3.jpg",
    "assets/images/bg3.jpg",
    "assets/images/bg3.jpg",
    "assets/images/bg3.jpg",
    "assets/images/bg3.jpg",
    "assets/images/bg3.jpg"
  ];
  var color = [
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          List.generate(name.length, (index) {
            return Card(
              color: color[index],
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(image[index]),
                ),
                title: Text(name[index]),
                subtitle: Text(phone[index]),
                trailing: Icon(Icons.headphones_rounded),
              ),
            );
          }),
        ),
      ),
    );
  }
}
