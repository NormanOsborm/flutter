import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: flexibleeg(),));
}
class flexibleeg extends StatefulWidget {
  const flexibleeg({super.key});

  @override
  State<flexibleeg> createState() => _flexibleegState();
}

class _flexibleegState extends State<flexibleeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [Flexible(flex: 2,
              child: Container(
                color: Colors.red[100],
              ),
            ),

              Flexible(flex: 4,
                child: Container(
                  color: Colors.yellow[100],
                ),
              ),
              Flexible(flex: 2,
                child: Container(
                  color: Colors.cyan[100],
                ),
              ),
              Flexible(flex: 3,
                child: Container(
                  color: Colors.green[100],
                ),
              ),
            ],
            ),
        );
    }
}