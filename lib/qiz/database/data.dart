import 'package:hive/hive.dart';

class DatabaseService {
  static const String _userBoxName = 'users';

  /// Initialize the Hive box
  static Future<void> initializeDatabase() async {
    await Hive.openBox(_userBoxName);
  }

  /// Register a new user
  static Future<void> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    var userBox = Hive.box(_userBoxName);
    userBox.put(email, {'name': name, 'password': password, 'games': {}});
  }

  /// Retrieve user details by email
  static Map<String, dynamic>? getUserDetails(String email) {
    var userBox = Hive.box(_userBoxName);
    return userBox.get(email) as Map<String, dynamic>?;
  }

  /// Update user details
  static Future<void> updateUserDetails({
    required String email,
    required String name,
    required String password,
  }) async {
    var userBox = Hive.box(_userBoxName);
    userBox.put(email, {'name': name, 'password': password});
  }

  /// Delete user
  static Future<void> deleteUser(String email) async {
    var userBox = Hive.box(_userBoxName);
    userBox.delete(email);
  }

  /// Check if the email is already registered
  static bool isEmailRegistered(String email) {
    var userBox = Hive.box(_userBoxName);
    return userBox.containsKey(email);
  }

  /// Update the game scores for the specified user
  static Future<void> updateGameScores({
    required String email,
    required String game,
    required int level1Score,
    required int level2Score,
    required int level3Score,
  }) async {
    var userBox = Hive.box(_userBoxName);

    // Get the existing user details
    Map<String, dynamic>? userDetails = userBox.get(email);

    if (userDetails != null) {
      // Initialize the "games" field if it doesn't exist
      Map<String, dynamic> games = userDetails['games'] ?? {};

      // Update the scores for the specified game
      games[game] = {
        'level1': level1Score,
        'level2': level2Score,
        'level3': level3Score,
      };

      // Ensure the 'games' field is updated
      userDetails['games'] = games;

      // Save the updated details
      await userBox.put(email, userDetails);
    }
  }
}
