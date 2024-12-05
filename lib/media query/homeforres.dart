import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpro/media%20query/center.dart';
import 'package:flutterpro/media%20query/left.dart';
import 'package:flutterpro/media%20query/resposnive.dart';
import 'package:flutterpro/media%20query/right.dart';
void main(){
  runApp(MaterialApp(home: Homeforres(),debugShowCheckedModeBanner: false,));
}
class Homeforres extends StatefulWidget {
  const Homeforres({super.key});

  @override
  State<Homeforres> createState() => _HomeforresState();
}

class _HomeforresState extends State<Homeforres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appbar ahn mwonu"),
        actions: [
          if (!Resposnive.isWeb(context))
            IconButton(
              onPressed: () {
                if (MediaQuery.of(context).orientation ==
                    Orientation.portrait) {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.landscapeLeft]);
                } else {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp]);
                }
              },
              icon: Icon(Icons.arrow_drop_down_circle),
            ),
        ],
      ),
      drawer: Left(),
      body: Row(
        children: [
          if(Resposnive.isWeb(context))
          Expanded(child: Left(),flex: 2,),
          Expanded(child: Centers(),flex: 5,),
          if(Resposnive.isWeb(context))
          Expanded(child: Right(),flex: 3,),
        ],
      ),
    );
  }
}
