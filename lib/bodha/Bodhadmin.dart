import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bodhahelper.dart';
import 'bodhalog.dart';

class Bodhadmin extends StatefulWidget {
  const Bodhadmin({super.key});

  @override
  State<Bodhadmin> createState() => _BodhadminState();
}

class _BodhadminState extends State<Bodhadmin> {
  late Future<List<Map<String, dynamic>>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    setState(() {
      _usersFuture = BodhaHelper.getAllUsers();
    });
  }

  Future<void> _deleteUser(int id) async {
    await BodhaHelper.deleteUser(id);
    _loadUsers(); // Reload users after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Welcome Home Sir",
                  style: GoogleFonts.merriweather(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                        // Check if there are users to display
                        if (users.isEmpty)
                          const Text("No registered users available"),
                        // User list with delete option
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
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
                    MaterialPageRoute(builder: (context) => const Bodhalog(name: '')),
                  ),
                  icon: const Icon(IconlyBold.logout),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
