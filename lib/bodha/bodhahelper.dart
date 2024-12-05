import 'dart:async';
import 'package:flutterpro/sqflite/helper.dart';
import 'package:sqflite/sqflite.dart' as sql;

class BodhaHelper {
  static Future<sql.Database> bData() async {
    return sql.openDatabase(
      'bData.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createToDate(database);
      },
    );
  }

  static Future<void> createToDate(sql.Database database) async {
    return await database.execute('''
    CREATE TABLE Bodha(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      email TEXT UNIQUE,
      pass TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    ''');
  }

  static Future<int> createBodha(String email, String name, String pass) async {
    final db = await BodhaHelper.bData();
    final data = {'email': email, 'name': name, 'pass': pass};
    final id = await db.insert('Bodha', data);
    return id;
  }

  static Future<List<Map>> loginUser(String email) async {
    final db = await BodhaHelper.bData();
    final data = await db.rawQuery("SELECT * FROM Bodha WHERE email = ?", [email]);
    return data;
  }

  static Future<int?> createNewUser(String email, String password, String name) async {
    final db = await BodhaHelper.bData();

    var existingUser = await loginUser(email);
    if (existingUser.isNotEmpty) {
      return null;
    }

    final data = {'email': email, 'pass': password, 'name': name};
    final id = await db.insert('Bodha', data);
    return id;
  }
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await BodhaHelper.bData();
    return db.query('Bodha');
  }

  static Future<void> deleteUser(int id) async {
    final db = await BodhaHelper.bData();
    await db.delete('Bodha', where: 'id = ?', whereArgs: [id]);
  }}
