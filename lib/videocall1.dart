import 'package:flutter/material.dart';

import 'callpage.dart';




class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  TextEditingController callIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2 ,
              child: TextFormField(
                controller: callIdController,
                decoration: const InputDecoration(
                  hintText: "please enter user id ",

                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2 ,
              child: TextFormField(
                controller: userIdController,
                decoration: const InputDecoration(
                  hintText: "please enter  id ",

                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2 ,
              child: TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: "please enter user Name id ",

                ),
              ),
            ),
            TextButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CallPage(
                callID: callIdController.text,
                userId: userIdController.text,
                userName: userNameController.text,

              ),));

            } , child: Text("join the call"))
          ],
        ),
      ),
    );
  }
}