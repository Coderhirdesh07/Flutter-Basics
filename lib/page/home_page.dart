import "package:flutter/material.dart";
import "../component/todo.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoList(),
        ],
      ),
    );
  }
}