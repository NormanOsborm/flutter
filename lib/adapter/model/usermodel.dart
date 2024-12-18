import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'usermodel.g.dart';

//@HiveType(typeId: 1)


@HiveType(typeId: 1)
class Master {

  @HiveField(0)
  final  String email;

  @HiveField(1)
  final String password;

  @HiveField(2)
  String? id;

  Master({required this.email, required this.password}){
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}