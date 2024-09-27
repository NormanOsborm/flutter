import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  var name = [

    "Noeal flutter",
    "Vishnu V",
    "H A R I (You)",
    "Ebin flutter",
    "Rahul flutter",
    "Ambika",
    "Amy jose",
    "Sivesh",
    "Basil",
    "Alvin"
  ];

  var message = [
    "aah da",
    "aa ok",
    "doing fine",
    "thank you da",
    "ok",

    "ayseri",
    "Ha",
    "aam",
    "Da da da",
    "blah balh",
  ];

  var image = [
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
    "assets/images/file2.png",
  ];

  var colors = [
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              cursorColor: Colors.green,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Ask Meta AI or Search',
                hintStyle: TextStyle(fontSize: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(image[index]),
                    backgroundColor: colors[index],
                  ),
                  title: Text(name[index]),
                  subtitle: Text(message[index]),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
