import 'package:hive/hive.dart';

part 'usermodel.g.dart';

@HiveType(typeId: 0)
class UserScore extends HiveObject {
  @HiveField(0)
  String userName;

  @HiveField(1)
  int level1Score;

  @HiveField(2)
  int level2Score;

  @HiveField(3)
  int level3Score;

  UserScore({
    required this.userName,
    required this.level1Score,
    required this.level2Score,
    required this.level3Score,
  });

  int get totalScore => level1Score + level2Score + level3Score;
}
