import 'package:flutter/material.dart';




class Counter extends StatefulWidget{


  final String ?text1;
  final String ?text2;
   Counter({Key? key, @required this.text1,@required this.text2}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> _CounterState();

  }
 class _CounterState extends State<Counter>{
  int count =20;

  @override
  Widget build(BuildContext context) {
    print("do again");
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(widget.text1.toString()),
            Text(widget.text2.toString()),
            Text(count.toString()),
            ElevatedButton(onPressed: () {

              count++;
              setState(() {

              });
            }, child: Text("incerment")),
     // Text(count.toString()),
            SizedBox(height: 20),
      ElevatedButton(onPressed: () {
        count--;
        setState(() {

        });
      },child: Text("decerment")),
          ],
        ),
      ),
    );
  }
  }





