import "package:flutter/material.dart";
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
  final box = Hive.openBox("my_box");
  List todoList = [
    ["Make Tutorial",false],
    ["Do Excersice",false]
  ];
  void checkBoxChanged(bool? value,int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context,
     builder: (context) {
      return DialogBox(controller: _controller,onSave: saveNewTask,onCancel: ()=>Navigator.of(context).pop(),);
     },
    );
  }

  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
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
        itemCount:todoList.length ,
        itemBuilder: (context,index){
          return ToDoList(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1], 
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context)=> deleteTask(index),
            );
        },
      ),
      );
  }
}