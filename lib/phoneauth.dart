// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'otpauth.dart';
//
//
//
//  class PhoneAuth extends StatefulWidget {
//   const PhoneAuth({super.key});
//
//   @override
//   State<PhoneAuth> createState() => _PhoneAuthState();
// }
//
// class _PhoneAuthState extends State<PhoneAuth> {
//    TextEditingController phoneController= TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       appBar: AppBar(
//         title: Text("Phone Auth"),
//         centerTitle: true,
//       ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 25),
//            child: TextField(
//              controller: phoneController,
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                hintText: "Enter phone Number",
//                suffixIcon: Icon(Icons.phone),
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.circular(25),
//                )
//              ),
//            ),
//          ),
//
//          SizedBox(height: 30,),
//          ElevatedButton(onPressed: ()async {
//            await FirebaseAuth.instance.verifyPhoneNumber(
//                verificationCompleted: (PhoneAuthCredential credential) {},
//                verificationFailed: (FirebaseAuthException ex) {},
//                codeSent: (String verificationid, int? resendtoken) {
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpAuth(verficationid: verificationid)));
//                },
//                codeAutoRetrievalTimeout: (String verificationId) {},
//                phoneNumber: phoneController.text.toString());
//          }, child: Text("Verify phone Number"))
//        ],
//      ),
//    );
//   }
// }
