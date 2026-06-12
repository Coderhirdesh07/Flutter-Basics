import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(25.0),
     child: Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          Text("Make Tutorial"),
        ],
      ),
      decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(12)),
     ),
    );
  }
}