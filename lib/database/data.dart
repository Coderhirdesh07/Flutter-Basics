import 'package:hive_flutter/hive_flutter.dart';
class TodoDatabase{
  // reference
  List TodoList = [];

  final mybox = Hive.openBox("my_box");
}