import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Bottomsheet(),
    debugShowCheckedModeBanner: false,
  ));
}

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text("show"),
          onTap: () => show(context),
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: const [
            ListTile(
              title: Text("data1"),
              subtitle: Text("data2"),
            ),
            ListTile(
              title: Text("data1"),
              subtitle: Text("data2"),
            ),
            ListTile(
              title: Text("data1"),
              subtitle: Text("data2"),
            ),
          ],
        );
      },
    );
  }
}