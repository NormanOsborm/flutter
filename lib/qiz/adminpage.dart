import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'loginpage.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AdminPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Box usersBox;

  @override
  void initState() {
    super.initState();
    usersBox = Hive.box('users');
  }

  void showBottomSheet(String type) {
    List<Map<String, dynamic>> usersData = [];
    for (var key in usersBox.keys) {
      final user = usersBox.get(key) as Map<String, dynamic>;
      usersData.add({'email': key, ...user});
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Divider(thickness: 1),
              ListView.builder(
                shrinkWrap: true,
                itemCount: usersData.length,
                itemBuilder: (context, index) {
                  final user = usersData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          user['name'][0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        user['name'],
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      subtitle: Text(
                        type == "Players' Details"
                            ? 'Email: ${user['email']}'
                            : _formatScores(user['games']),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            usersBox.delete(user['email']);
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatScores(Map<String, dynamic>? games) {
    if (games == null || games.isEmpty) {
      return 'No games played';
    }
    String scores = '';
    games.forEach((game, levels) {
      scores += '$game: ${levels['level1']}/${levels['level2']}/${levels['level3']}\n';
    });
    return scores.trim();
  }

  void logOut() {
    // Handle logout logic here (e.g., clear session, navigate to login page)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  LoginPageA()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Admin Dashboard',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome, Admin',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => showBottomSheet("Players' Details"),
                      icon: const Icon(Icons.person, color: Colors.black),
                      label: Text(
                        "View Players' Details",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => showBottomSheet("Players' Scores"),
                      icon: const Icon(Icons.score, color: Colors.black),
                      label: Text(
                        "View Players' Scores",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: logOut,
                      icon: const Icon(Icons.logout, color: Colors.white),
                      label: Text(
                        "Logout",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final String email;

  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Box usersBox;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    usersBox = Hive.box('users');
    final user = usersBox.get(widget.email) as Map<String, dynamic>;
    nameController = TextEditingController(text: user['name']);
  }

  void saveProfile() {
    final updatedUser = {
      'name': nameController.text,
      // Add any other fields you want to update here
    };
    usersBox.put(widget.email, updatedUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveProfile,
              child: Text(
                'Save Profile',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


