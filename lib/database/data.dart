import 'package:hive_flutter/hive_flutter.dart';
class TodoDatabase{
  // reference
  List TodoList = [];

  final mybox = Hive.box("my_box");
  
  // runs this method if this is the 1st time ever opening app
  void createInitialData(){
    TodoList = [
      ["Make Tutorail",false],
      ["Do Excersise",false]
    ];
  }
  void loadData(){
    TodoList = mybox.get("TODOLIST");
  }
  void updateDatabase(){
    mybox.put("TODOLIST", TodoList);
  }
}