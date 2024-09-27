import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(home: Listviewbuilder(),));
// }
class Listviewbuilder extends StatelessWidget{
  var name=["noeal mwonue","reehul mwonu","ebin mwonu","njan","blah","vlah"];
  var phone=["blah","blah","blah","blah","blah","blah"];
  var image= [
    'assets/images/1..jpeg',
    'assets/images/2..jpeg',
    'assets/images/3..jpeg',
    'assets/images/4..jpeg',
    'assets/images/5..jpeg',
    'assets/images/6..jpeg'

  ];
  var color=[Colors.green,Colors.green,Colors.green,Colors.green,Colors.green,Colors.green,];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(image[index]),),
            title: Text(name[index]),
            subtitle: Text(phone[index]),

            trailing: Icon(Icons.call),


        ),);
      },itemCount: name.length ,),
    );
  }
}