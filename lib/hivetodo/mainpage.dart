import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("task_box");
  runApp(
      const MaterialApp(home: TodoHive(), debugShowCheckedModeBanner: false));
}

class TodoHive extends StatefulWidget {
  const TodoHive({super.key});

  @override
  State<TodoHive> createState() => _TodoHiveState();
}

class _TodoHiveState extends State<TodoHive> {
  List<Map<String, dynamic>> task = []; // store task from hive db
  final tbox = Hive.box('task_box'); //object creation of hive


  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await tbox.add(task);
    loadTask();
  }

  void loadTask() {
    final data = tbox.keys.map((id) {
      final value = tbox.get(id);
      return {
        'key': id,
        'title': value['title'],
        'subtitle': value['subtitle']
      };
    }).toList();
    setState(() {
      task = data.reversed.toList();
    });
  }


  Future<void> updateTask(int key, Map<String, dynamic> uptask)async {
    await tbox.put(key, uptask);
    loadTask();
  }
  Future<void> deleteTask(int key)async {
    await tbox.delete(key);
    loadTask();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(task[index]['title']),
              subtitle: Text(task[index]['subtitle']),
              trailing: SizedBox(
                child: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          showform(context, task[index]['key']);
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          deleteTask(task[index]['key']);
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: task.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showform(context, null),
        child: const Text('Add new'),
      ),
    );
  }
  final title = TextEditingController();
  final subtitle = TextEditingController();
  void showform(BuildContext context, int ?id) async{
    if(id!=null){
      print(id);
      final ex_task=
          task.firstWhere((element)=>element['key']==id);
      print(ex_task ['title']);
      title.text=ex_task['title'];

      subtitle.text=ex_task['subtitle'];
    }

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                TextField(
                  controller: subtitle,
                  decoration: InputDecoration(
                      hintText: 'Subtitle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {createTask({'title': title.text, 'subtitle': subtitle.text});
                      }if(id!=null){
                        updateTask(id,{'title':title,'subtitle':subtitle});
                      }
                      title.text="";
                      subtitle.text="";
                      Navigator.of(context).pop();
                    },
                    child:  Text(id == null ? "Add":"Update")),
              ],
            ),
          );
        });
  }


}
