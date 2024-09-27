import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: expandedeg(),));
}
class expandedeg extends StatefulWidget {
  const expandedeg({super.key});

  @override
  State<expandedeg> createState() => _expandedegState();
}

class _expandedegState extends State<expandedeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Container(color: Colors.red[100], height: 100,),
          Container(color: Colors.yellow[100], height: 100,),
          Expanded(child: Container(color: Colors.cyan[100],
            height: 100,
            width: double.infinity,),)
        ],
      ),
      /*Row(

          children: [Container(color: Colors.red[100],height: 100,width: 100,),
            Container(color: Colors.yellow[100],height: 100,width: 100,),
            Expanded(child: Container(color: Colors.cyan[100],height: 100,width:double.infinity,),)
          ],
        ),
*/
    );
  }
}