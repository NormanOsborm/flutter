import 'dart:async';
import 'package:sqflite/sqflite.dart' as sql;

class StiltonHelper {
  static Future<sql.Database> sData() async {
    return sql.openDatabase(
      'sData.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createToData(database);
      },
    );
  }

  static Future<void> createToData(sql.Database database) async {
    return await database.execute('''
      CREATE TABLE Stilton(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      email TEXT UNIQUE,
      dob TEXT,
      pass TEXT,
      createAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  static Future<int> createSt(String email, String name, String dob, String pass) async {
    final db = await StiltonHelper.sData();
    final data = {'email': email, 'name': name, 'dob': dob, 'pass': pass};
    final id = await db.insert('Stilton', data);
    return id;
  }

  static Future<List<Map>> userLogin(String email) async {
    final db = await StiltonHelper.sData();
    return await db.query('Stilton', where: 'email = ?', whereArgs: [email], limit: 1);
  }

  static Future<int?> existingUser(String email, String name, String dob, String password) async {
    final db = await StiltonHelper.sData();
    var userExist = await userLogin(email);
    if (userExist.isNotEmpty) {
      return null;
    }
    final data = {'email': email, 'name': name, 'dob': dob, 'pass': password};
    final id = await db.insert('Stilton', data);
    return id;
  }
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await StiltonHelper.sData();
    return db.query('Stilton');
  }

  static Future<void> deleteUser(int id) async {
    final db = await StiltonHelper.sData();
    await db.delete('Stilton', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateUser(int id, String name, String email, String dob, String password) async {
    final db = await StiltonHelper.sData();
    await db.update(
      'Stilton',
      {'name': name, 'email': email, 'dob': dob, 'pass': password},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
