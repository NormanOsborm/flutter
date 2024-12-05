import 'package:flutter/material.dart';
import 'helper.dart';

void main() => runApp(const MaterialApp(
  home: MainPage(),
));

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> noteFromDb = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() async {
    final data = await SqfLiteHelper.readNotes();
    setState(() {
      noteFromDb = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${noteFromDb[index]['title']}'),
              subtitle: Text('${noteFromDb[index]['subtitle']}'),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => showForm(noteFromDb[index]['id']),
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () => deleteNote(noteFromDb[index]['id']),
                        icon: const Icon(Icons.delete)
                      ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: noteFromDb.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(null),
        child: const Text('Add new'),
      ),
    );
  }

  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();

  void showForm(int? id) async {
    if (id != null) {
      final existingData = noteFromDb.firstWhere((note) => note['id'] == id);
      title.text = existingData['title'];
      subtitle.text = existingData['subtitle'];
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding:  EdgeInsets.only(left: 10,top: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: subtitle,
                  decoration: InputDecoration(
                      hintText: 'Subtitle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await addNote();
                      } else {
                        await updateNote(id);
                      }


                      title.clear();
                      subtitle.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Add' : 'Update')),
              ],
            ),
          );
        });
  }

  Future<void> addNote() async {
    await SqfLiteHelper.createNotes(title.text, subtitle.text);
    refreshData();
  }

  Future<void> updateNote(int id) async {
    await SqfLiteHelper.updateNote(id, title.text, subtitle.text);
    refreshData();
  }

  void deleteNote(int id) async {
    await SqfLiteHelper.deleteNote(id);
    refreshData();
  }
}
