import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Ordercont(),
    debugShowCheckedModeBanner: false,
  ));
}

class Ordercont extends StatelessWidget {
  const Ordercont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Horizontal Tab Menu
          Container(
            color: Colors.white,
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabButton(context, "All Orders", Colors.red),
                  _buildTabButton(context, "Pending", Colors.black),
                  _buildTabButton(context, "Processing", Colors.black),
                  _buildTabButton(context, "Delivery", Colors.black),
                ],
              ),
            ),
          ),

          // List of Orders
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Image.asset(order['image'], width: 50),
                    title: Text(
                      order['name'],
                      style: GoogleFonts.overpass(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order['price'],
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(order['status'],
                            style: TextStyle(
                                color: order['status'] == 'Pending'
                                    ? Colors.orange
                                    : order['status'] == 'Processing'
                                    ? Colors.blue
                                    : Colors.red)),
                      ],
                    ),
                    trailing: Text(order['date'],
                        style: TextStyle(color: Colors.grey)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTabButton(BuildContext context, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            label,
            style: GoogleFonts.overpass(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Updated list content based on the image
final List<Map<String, dynamic>> orders = [
  {
    'image': 'assets/images/tomato-1000x1000.jpg', // Replace with actual image asset
    'name': 'Pork Chops (2kg)',
    'price': '\$52.25',
    'status': 'Processing',
    'date': 'Jan 16, 2021'
  },
  {
    'image': 'assets/images/Cabbage.jpeg', // Replace with actual image asset
    'name': 'Banana (2 Pcs)',
    'price': '\$11.50',
    'status': 'Pending',
    'date': 'Jan 16, 2021'
  },
  {
    'image': 'assets/images/Cabbage.jpeg', // Replace with actual image asset
    'name': 'Cabbage (1 Pcs)',
    'price': '\$5.15',
    'status': 'Delivered',
    'date': 'Jan 16, 2021'
  },
  {
    'image': 'assets/images/Pottato.jpeg', // Replace with actual image asset
    'name': 'Potato (3kg)',
    'price': '\$25.70',
    'status': 'Delivered',
    'date': 'Jan 16, 2021'
  },
  {
    'image': 'assets/images/tomato-1000x1000.jpg', // Replace with actual image asset
    'name': 'Pork Chops (2kg)',
    'price': '\$52.25',
    'status': 'Processing',
    'date': 'Jan 16, 2021'
  },
  {
    'image': 'assets/images/Cabbage.jpeg', // Replace with actual image asset
    'name': 'Banana (2 Pcs)',
    'price': '\$11.50',
    'status': 'Pending',
    'date': 'Jan 16, 2021'
  },
  {
    'image': 'assets/images/Cabbage.jpeg', // Replace with actual image asset
    'name': 'Cabbage (1 Pcs)',
    'price': '\$5.15',
    'status': 'Delivered',
    'date': 'Jan 16, 2021'
  },
];
