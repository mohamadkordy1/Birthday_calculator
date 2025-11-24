import 'package:flutter/material.dart';
import 'home.dart';

void main()=>runApp(myApp());
class myApp extends StatelessWidget {
  const myApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "birthday calculator",
      debugShowCheckedModeBanner: false,
      home: home(),

    );
  }
}
