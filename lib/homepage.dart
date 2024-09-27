import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Homepage(),debugShowCheckedModeBanner: false,));

}
class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          Card(color: Colors.white,
          child: ListTile(
            leading: Image(image: AssetImage("assets/images/file3.png")),
            title: Text("Noeal Mwonu"),
            subtitle: Text("9867653432"),
            trailing: Icon(Icons.call),

          ),
          ),
          Card(color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/bg2.jpg"),),
            title: Text("njan thanne"),
            subtitle: Text("blah blah valh"),
            trailing: Icon(Icons.call),
          ),
          ),

          Card(color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/bg.png"),),
              title: Text("ebhin mwonu"),
              subtitle: Text("Otta mind"),
              trailing: Icon(Icons.call),
            ),
          ),
          Card(color: Colors.white,
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/file3.png"),),
              title: Text("reehul mwonu"),
              subtitle: Text("blaah"),
              trailing: Icon(Icons.call),
            ),
          ),
          Card(color: Colors.white,
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/file1.png"),),
              title: Text("blah"),
              subtitle: Text("blaah"),
              trailing: Icon(Icons.call),
            ),
          ),
          Card(color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/bg3.jpg"),),
              title: Text("blah"),
              subtitle: Text("blaah"),
              trailing: Icon(Icons.call),
            ),
          ),
          Card(color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/bg.png"),),
              title: Text("blah"),
              subtitle: Text("blaah"),
              trailing: Icon(Icons.call),
            ),
          ),
          Card(color: Colors.white,
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/file2.png"),),
              title: Text("blah"),
              subtitle: Text("blaah"),
              trailing: Icon(Icons.call),
            ),
          ),
        ],
      ),
    );
  }
}