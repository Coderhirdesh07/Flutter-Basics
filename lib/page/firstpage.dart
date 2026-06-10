import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget{
 const Firstpage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar"),),
      body: Center(child: ElevatedButton(
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()),
          Navigator.pushNamed(context, "/secondpage")
          );
        }, 
        child: Text("2nd Page")),
        ),
    );
  }
}