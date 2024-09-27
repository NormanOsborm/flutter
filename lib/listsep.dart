import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Listsep()));
}

class Listsep extends StatelessWidget {
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                month[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          if (index % 3 == 0) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.redAccent,
                child: Text(
                  "Advertisement",
                  style: TextStyle(color: Colors.white,),

                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
        itemCount: month.length,
      ),
    );
  }
}
