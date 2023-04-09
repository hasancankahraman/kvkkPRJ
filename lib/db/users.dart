// ignore_for_file: unused_import

import 'package:isar/isar.dart';

part 'users.g.dart';

@collection
class Users {
  Id id = Isar.autoIncrement;
  String? title = "";
  String? content = "";
  DateTime time = DateTime.now();
}
