import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterpro/stiltons/stiltonhelper.dart';
import 'package:flutterpro/stiltons/stiltonlog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class Stiltonadmin extends StatefulWidget {
  const Stiltonadmin({super.key});

  @override
  State<Stiltonadmin> createState() => _StiltonadminState();
}

class _StiltonadminState extends State<Stiltonadmin> {
  late Future<List<Map<String, dynamic>>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    setState(() {
      _usersFuture = StiltonHelper.getAllUsers();
    });
  }

  Future<void> _deleteUser(int id) async {
    await StiltonHelper.deleteUser(id);
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/thsm.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: BlurredCard(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Welcome",
                        style: GoogleFonts.merriweather(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: _usersFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text("Error loading users");
                        } else {
                          final users = snapshot.data ?? [];
                          return Column(
                            children: [
                              // User count card
                              Card(
                                margin: const EdgeInsets.all(16),
                                color: Colors.blueAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Total Registered Users: ${users.length}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              if (users.isEmpty)
                                const Text("No registered users available"),

                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),

                                shrinkWrap: true,
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  final user = users[index];
                                  return Card(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: ListTile(
                                      title: Text(user['name']),
                                      subtitle: Text(user['email']),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () => _deleteUser(user['id']),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Stiltonlog()),
                        ),
                        icon: const Icon(IconlyBold.logout),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BlurredCard extends StatelessWidget {
  final Widget child;
  const BlurredCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ),
    );
  }
}
