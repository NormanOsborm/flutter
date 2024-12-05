import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'adminpage.dart';
import 'quiz/level/levelone.dart';

class Userhomepage extends StatefulWidget {
  final String userName;
  final int? level1Score;
  final int? level2Score;
  final int? level3Score;

  const Userhomepage({
    Key? key,
    required this.userName,
    this.level1Score,
    this.level2Score,
    this.level3Score,
  }) : super(key: key);

  @override
  State<Userhomepage> createState() => _UserhomepageState();
}

class _UserhomepageState extends State<Userhomepage> {
  // Simulating database fetch
  List<Map<String, dynamic>> previousScores = [];

  @override
  void initState() {
    super.initState();
    fetchPreviousScores();
  }

  Future<void> fetchPreviousScores() async {
    // Simulate fetching scores from the database
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Mock data - replace with actual database fetch logic
    setState(() {
      previousScores = [
        {"quiz": "Level 1", "score": widget.level1Score ?? 0},
        {"quiz": "Level 2", "score": widget.level2Score ?? 0},
        {"quiz": "Level 3", "score": widget.level3Score ?? 0},
      ];
    });
  }

  Widget buildScoreCard(String label, int score) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.lightGreenAccent,
        child: ListTile(
          title: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            "$score",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void showPreviousScores() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Previous Scores",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const Divider(thickness: 1),
              ...previousScores.map((score) {
                return ListTile(
                  leading: const Icon(Icons.assignment_turned_in,
                      color: Colors.teal),
                  title: Text(
                    score['quiz'],
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  trailing: Text(
                    "${score['score']}",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        title: Text(
          'Aqwiz',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightGreenAccent),
              accountName: Text(
                'Hello, ${widget.userName}\nAre you ready To LEARN!',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                'Welcome to Aqwiz',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 30, color: Colors.teal),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.teal),
              title: Text(
                'Profile',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () => Navigator.push( context,
                MaterialPageRoute(builder: (context) => const ProfilePage(email: '',)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.teal),
              title: Text(
                'About',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined, color: Colors.teal),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "Hi ${widget.userName}, Welcome!",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Levelone()),
                    );
                  },
                  child: Text(
                    'Start Quiz',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: const BorderSide(color: Colors.teal, width: 2),
                ),
                onPressed: showPreviousScores,
                icon: const Icon(Icons.history, color: Colors.teal),
                label: Text(
                  "View Previous Scores",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
