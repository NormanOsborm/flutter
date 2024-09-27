import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main(){
  runApp(MaterialApp(home: Staggeredgridview(),));
}
class Staggeredgridview extends StatefulWidget {
  const Staggeredgridview({super.key});

  @override
  State<Staggeredgridview> createState() => _StaggeredgridviewState();
}

class _StaggeredgridviewState extends State<Staggeredgridview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        body:
        SingleChildScrollView(
          child: StaggeredGrid.count(crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10,
              children: [
                StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 2,
                    child: Container(color: Colors.red,
                      child: Text("1"),)),

                StaggeredGridTile.count(crossAxisCellCount: 2 , mainAxisCellCount: 1,
                    child: Container(color: Colors.pink,
                      child: Text("2"),)),

                StaggeredGridTile.count(crossAxisCellCount: 3, mainAxisCellCount: 1,
                    child: Container(color: Colors.orange,
                      child: Text("3"),)),

                StaggeredGridTile.count(crossAxisCellCount: 5, mainAxisCellCount: 4,
                    child: Container(color: Colors.blue,
                      child: Text("4"),)),

                StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1,
                    child: Container(color: Colors.black,
                      child: Text("5"),)),

                StaggeredGridTile.count(crossAxisCellCount: 3, mainAxisCellCount: 2,
                    child: Container(color: Colors.yellow,
                      child: Text("6"),)),

                StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1,
                    child: Container(color: Colors.brown,
                      child: Text("7"),)),

                StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1,
                    child: Container(color: Colors.greenAccent,
                      child: Text("8"),)),


              ]),),
      );
}
}