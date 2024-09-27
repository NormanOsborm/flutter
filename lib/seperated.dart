import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: SeparatedList()));
// }

class SeparatedList extends StatelessWidget {
  var name = ["njan", "blah", "blah", "blah"];
  var color = [Colors.deepPurple, Colors.deepPurple, Colors.deepPurple, Colors.deepPurple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Separated"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            color: color[index],
            child: ListTile(
              title: Text(name[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 5,
            color: Colors.blue,
          );
        },
        itemCount: name.length, // Corrected itemCount
      ),
    );
  }
}
