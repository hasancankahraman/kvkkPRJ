// ignore_for_file: unused_import

import 'package:isar/isar.dart';

part 'post.g.dart';

@collection
class Post {
  Id id = Isar.autoIncrement;
  String? title = "";
  String? content = "";
  String? imagePath = "";
  DateTime time = DateTime.now();
}
