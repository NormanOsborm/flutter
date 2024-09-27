import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: CustomScrollViewExample(), debugShowCheckedModeBanner: false));
}

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  var name = [
    "noeal mwonue",
    "reehul mwonu",
    "ebin mwonu",
    "njan",
    "blah",
    "vlah",
    "noeal mwonue",
    "reehul mwonu",
    "ebin mwonu",
    "njan",
    "blah",
    "vlah"
  ];
  var phone = [
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah",
    "blah"
  ];
  var image = [
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png',
    'assets/images/file3.png'
  ];
  var color = [
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent,
    Colors.orangeAccent
  ];
  var icons = [
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarm_outlined,
    Icons.add_circle,
    Icons.ac_unit,
    Icons.insert_comment_rounded,
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarm_outlined,
    Icons.add_circle,
    Icons.ac_unit,
    Icons.insert_comment_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Colors.orangeAccent,
            title: const Text("CustomScrollView"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                title: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search blah... ",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            expandedHeight: 140,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.limeAccent,
              height: 50,
              child: const Center(
                  child: Text("new data", style: TextStyle(color: Colors.white))),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      image[index],
                      fit: BoxFit.cover,
                    ),
                    title: Text(name[index]),
                    subtitle: Text(phone[index]),
                  ),
                );
              },
              childCount: name.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.lime,
              height: 50,
              child: const Center(
                  child: Text("new data", style: TextStyle(color: Colors.white))),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Card(
                  color: color[index],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[index], size: 40),
                        SizedBox(height: 8), // Space between icon and text
                        Text(name[index]),
                      ],
                    ),
                  ),
                );
              },
              childCount: name.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
