import 'package:flutter/material.dart';
//import 'package:new1_project/videocall1.dart';

import 'videocall1.dart';


class video2 extends StatelessWidget {
  const video2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(


          primarySwatch: Colors.cyan
      ),
      home: const video(),


    );
  }
}