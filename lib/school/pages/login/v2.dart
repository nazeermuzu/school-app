import 'package:flutter/material.dart';
import 'package:new2/school/api/api.dart';
import 'package:pinput/pinput.dart';

import '../../../apgschools.dart';

class V2 extends StatelessWidget {
  TextEditingController pinController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API OTP"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Pinput(
              controller: pinController,
              keyboardType: TextInputType.number,
              length: 4,
              // Default pin theme
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onCompleted: (pin) =>
                  print(pin), // Triggered when the pin is complete
            ),
          ),
          ElevatedButton(
            child: const Text('Verify OTP'),
            onPressed: () {
              Api().verifyotp(pinController.text,phonecontroller.text);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
              //print("Verifying OTP...");
            },
          ),
        ],
      ),
    );
  }
}
