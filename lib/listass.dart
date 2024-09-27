import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Listass()));
  }

  class Listass extends StatelessWidget{
  var name=["Facebook","A10 NETWORKS ING.","Intel Corp","HP Inc","Advanced Micro Devices Inc","Apple Inc","Amazon.com, Inc.","Microsoft Corporation",];
  var asset=["\$343.4B", "\$1.1B", "\$219.0B", "\$31.2B", "\$97.8B", "\$2.87T", "\$1.23T", "\$2.48T"];
  var zeroindex=["F","A","I","H","A","A","A","M"];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "List view builder",
          style: TextStyle(
              fontSize: 20,
            color: Colors.white,
          ),
      ),
backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue, child: Text(
            zeroindex[index],
            style: TextStyle(
              color: Colors.white,
            ),)
            ),
            title: Text(name[index]),
            //subtitle: Text(asset[index]),

            trailing: Text(asset[index]),


          ),);
      },itemCount: name.length
        ,),
    );
  }

  }