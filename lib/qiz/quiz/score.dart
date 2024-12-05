import 'package:flutter/material.dart';
import 'package:flutterpro/qiz/userhome.dart';

class Score extends StatelessWidget {
  final int level1Score;
  final int level2Score;
  final int level3Score;
  final String userName;
  final String gameName;
  final String email;

  const Score({
    super.key,
    required this.level1Score,
    required this.level2Score,
    required this.level3Score,
    required this.userName,
    required this.gameName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Game Scores",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // User Information Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User Name: $userName",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Text("Game Name: $gameName",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    Text("Email: $email",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Scores Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text("Level 1 Score: $level1Score",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Level 2 Score: $level2Score",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Level 3 Score: $level3Score",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text(
                      "Total Score: ${level1Score + level2Score + level3Score}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Userhomepage(userName: userName)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
