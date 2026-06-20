import "package:flutter/material.dart";
import "package:flutter_practise/database/data.dart";
import "../component/todo.dart";
import '../component/dialog.dart';
import "package:hive_flutter/hive_flutter.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final box = Hive.box("my_box");
  TodoDatabase db = TodoDatabase();
  // List todoList = [
  //   ["Make Tutorial",false],
  //   ["Do Excersice",false]
  // ];
  @override
  void initState() {
    if(box.get("TODOLIST")==null){
      db.createInitialData();
    }
    else {
      db.loadData();
    }
    super.initState();
    
  }
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.updateDatabase();
  }
  void saveNewTask(){
    setState(() {
      db.TodoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask(){
    showDialog(context: context,
     builder: (context) {
      return DialogBox(controller: _controller,onSave: saveNewTask,onCancel: ()=>Navigator.of(context).pop(),);
     },
    );
    db.updateDatabase();
  }

  void deleteTask(int index){
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask),
      body: ListView.builder(
        itemCount:db.TodoList.length ,
        itemBuilder: (context,index){
          return ToDoList(
            taskName: db.TodoList[index][0],
            taskCompleted: db.TodoList[index][1], 
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context)=> deleteTask(index),
            );
        },
      ),
      );
  }
}