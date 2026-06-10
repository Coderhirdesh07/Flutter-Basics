import 'package:flutter/material.dart';
import 'package:flutter_practise/page/firstpage.dart';
import 'package:flutter_practise/page/secondpage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Firstpage(),
      routes: {
        "/secondpage":(context) => SecondPage()
      },
    );
  }
}

