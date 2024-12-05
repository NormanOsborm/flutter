import 'package:flutterpro/adapter/model/usermodel.dart';
import 'package:hive/hive.dart';

class DBFunction {
  DBFunction.internal();
  static DBFunction instance = DBFunction.internal();

  factory DBFunction() {
    return instance;
  }

  Future<void> userSignup(Master user) async {
    final db = await Hive.openBox<Master>('users');
    db.put(user.id, user);
  }

  Future<List<Master>> getUser() async {
    final db = await Hive.openBox<Master>('users');
    return db.values.toList();
  }
}
