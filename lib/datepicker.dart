import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Datepicker(), debugShowCheckedModeBanner: false,));
}

class Datepicker extends StatefulWidget {
  const Datepicker({super.key});

  @override
  State<Datepicker> createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  DateTime selectdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: TextField(
            controller: TextEditingController(
                text: "${selectdate.toLocal()}".split(" ")[0]),
            readOnly: true,
            decoration: InputDecoration(
                hintText: "Select data",
                suffixIcon: Icon(Icons.calendar_today)
          ),
          onTap: () => dataselect(context),
        )
    ),);
  }

  Future<void> dataselect(BuildContext context) async {
    final DateTime ? picktime = await showDatePicker(
        context: context, firstDate: DateTime(2002), lastDate: DateTime(2026));
    if (picktime != null && picktime != selectdate);
    setState(() {
      selectdate = picktime!;
    });
  }
}
