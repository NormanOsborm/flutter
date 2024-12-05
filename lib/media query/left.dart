import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Left(), debugShowCheckedModeBanner: false,));
// }

class Left extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: [
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          const ListTile(
            leading: Icon(Icons.update),
            title: Text("Update"),
          ),
          const ListTile(
            leading: Icon(Icons.send),
            title: Text("Send"),
          ),
          const ListTile(
            leading: Icon(Icons.drafts),
            title: Text("Drafts"),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      );
    }, itemCount: 10,

    );
  }
}
