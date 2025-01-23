import 'package:flutter/material.dart';
import 'package:new2/school/api/api.dart';
import 'package:new2/school/pages/login/v2.dart';

class Votp extends StatelessWidget {
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API VERIY"),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter phone Number",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: const Text('Summit'),
            onPressed: () {
              Api().requestotp(phonecontroller.text);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => V2()));
              //  print("Verifying Phone Number...");
            },
          ),
        ]));
  }
}
