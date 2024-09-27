import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Checkedbox(),
    debugShowCheckedModeBanner: false,
  ));
}

class Checkedbox extends StatefulWidget {
  const Checkedbox({super.key});

  @override
  State<Checkedbox> createState() => _CheckedboxState();
}

class _CheckedboxState extends State<Checkedbox> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Checkbox(checkColor: Colors.black,
            focusColor: Colors.white,
             activeColor: Colors.white10,
            value: ischecked,
            onChanged: (bool? value) {
              setState(() {
                ischecked = value!;
              });
            }),

      ),
    );
  }
}
