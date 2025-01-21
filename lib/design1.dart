import 'package:flutter/material.dart';


class Design extends StatelessWidget{
  Design({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            color: Colors.red,
            height: 400,
            width: 400,
            ), Container(
          color: Colors.blue,
          height: 300,
          width: 300,
          ),
          Container(
            color: Colors.green,
            height:200,
            width: 200,
          ),
          Container(
            color: Colors.orange,
            height: 100,
            width: 100,
          )
        ],
      )
    );

  }
}