import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CitiesAroundWorld()));
}

class CitiesAroundWorld extends StatelessWidget {
  var city = [
    "Delhi",
    "Finland",
    "London",
    "Vancouver",
    "New York",
    "Tokyo"
  ];

  var details = [
    "country: India\npopulation: 32.9 mill",
    "country: Europe\npopulation: 5.54 mill",
    "country: UK\npopulation: 8.8 mill",
    "country: Canada\npopulation: 2.6 mill",
    "country: USA\npopulation: 8.4 mill",
    "country: Japan\npopulation: 37.4 mill"
  ];

  var images = [
    "assets/images/delhi.jpeg",
    "assets/images/finland.jpeg",
    "assets/images/london.jpeg",
    "assets/images/vancouver.jpeg",
    "assets/images/newyork.jpeg",
    "assets/images/tokyo.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cities Around the World",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          List.generate(city.length, (index) {
            return Card(
              color: Colors.orangeAccent,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(height: 100,width: 100,
                        child: Image.asset(
                          images[index],
                         width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        city[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        details[index],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
