import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Table(), debugShowCheckedModeBanner: false));
}

class Table extends StatefulWidget {
  const Table({super.key});

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataTable(
          border: TableBorder.all(width: 1.0, color: Colors.grey),
          columns: [
            DataColumn(
                label: Text(
              "Id",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "Job",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "Salary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text("1")),
              DataCell(Text("Hari")),
              DataCell(Text("Animator")),
              DataCell(Text("1.5l")),
            ]),
            DataRow(cells: [
              DataCell(Text("2")),
              DataCell(Text("Noeal Mwonu")),
              DataCell(Text("Textiles")),
              DataCell(Text("1.5k")),
            ]),
            DataRow(cells: [
              DataCell(Text("3")),
              DataCell(Text("Ebin Mwonu")),
              DataCell(Text("Heker")),
              DataCell(Text("5.5k")),
            ]),
            DataRow(cells: [
              DataCell(Text("4")),
              DataCell(Text("Rehul Mwonu")),
              DataCell(Text("Restourent Owner")),
              DataCell(Text("10.5k")),
            ]),
          ],
        ),
      ),
    );
  }
}
