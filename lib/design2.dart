import 'package:flutter/material.dart';
class MyApp extends StatelessWidget{
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: BounceAnimationDemo(),
    );
  }
}

class BounceAnimationDemo extends StatefulWidget {

  @override
  _BounceAnimationDemoState createState() => _BounceAnimationDemoState();
}

class _BounceAnimationDemoState extends State<BounceAnimationDemo> {
  double height2 = 100.0; // Initial height of the box
  double height1 = 100.0; // Initial height of the box

  void _startBounceAnimation() async {
    setState(() {
      height2 = 250.0;
      height1 = 150.0;

    });

    await Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        height2 = 100.0; // Reset the height after the bounce animation
        height1 = 100.0; // Reset the height after the bounce animation

      });
    });
   await  Future.delayed(Duration(milliseconds: 500)
    ,(){

    _startBounceAnimation();
    });
  }

  @override
  void initState(){
    _startBounceAnimation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
       Stack(

          alignment: Alignment.center,

         children: [
          Container(
             margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(500)),
            height: 400,
            width: 400,
          ),
           AnimatedContainer(
             duration: Duration(milliseconds: 500),

            margin: EdgeInsets.only(top: height1),
             decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(400)),
             width: 300,
             height: 300,

           ),
           AnimatedContainer(
             duration: Duration(milliseconds:500 ),
             margin: EdgeInsets.only(top: height2),
             width: 200,
             height: 200 ,
             decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.circular(300)),
           ),


         //   AnimatedContainer(
         //      duration: Duration(milliseconds:500 ),
         //    curve: Curves.bounceOut,
         //  height: 100,
         // width: 100,
         //
         //  //   margin: EdgeInsets.only(top: 20),
         //  // decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(100)),
         //   //  height:height,
         //
         //    ),
     ] ) ,


        );
  }
}

