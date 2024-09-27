import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SimpleContact(),debugShowCheckedModeBanner: false,));
}

class SimpleContact extends StatelessWidget {
   var name = ["person 1", "person 2", "person 3", "person 4", "person 5"];
  var phone = ["984652536", "99857357486", "48574857359", "998539976", "893757454"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SimpleContactList",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black38,
          ),
        ),
        backgroundColor: Colors.black12,
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black38,
                child: Icon(Icons.person),
              ),
              title: Text(name[index]),
              subtitle: Text(phone[index]),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}
