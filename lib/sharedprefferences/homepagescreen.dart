import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpagescreen.dart';

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({super.key});

  @override
  State<Homepagescreen> createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  late SharedPreferences data;
  String? name;

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      name = data.getString("name") ?? "regname";

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Page"),
      //   automaticallyImplyLeading: false,
      // ),
      body: ListView(
        children: [


          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome $name Sir",
                style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              data.setBool("newuser", true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  SharedPreferenceseg(),
                ),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
