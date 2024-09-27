import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listviewcustm(),));
}
class Listviewcustm extends StatelessWidget {


  var name=["noeal mwonue","reehul mwonu","ottamind","njan","blah","vlah"];
  var phone=["blah","blah","blah","blah","blah","blah"];
  var image=["assets/images/bg3.jpg","assets/images/bg3.jpg","assets/images/bg3.jpg","assets/images/bg3.jpg","assets/images/bg3.jpg","assets/images/bg3.jpg"];
  var color=[Colors.green,Colors.green,Colors.green,Colors.green,Colors.green,Colors.green];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.custom(childrenDelegate: SliverChildBuilderDelegate((context,index){
        return Card(
          child: ListTile(
            leading:CircleAvatar(backgroundImage: AssetImage(image[index]),) ,
            title:Text(name[index]) ,
            trailing: Wrap(
              children: [
                Icon(Icons.headphones_rounded),
                SizedBox(width: 5,),
                Icon(Icons.delete)
              ],
            ),
          ),
        );
      },
        childCount: name.length,
      ),
      ),
    );
  }
}