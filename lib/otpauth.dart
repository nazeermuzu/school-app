// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:new1_project/design2.dart';
// // import 'package:new1_project/phoneauth.dart';
// import 'dart:developer';
//
// import 'design2.dart';
//
//  class OtpAuth extends StatefulWidget {
//    String verficationid;
//    OtpAuth({super.key,required this.verficationid});
//
//
//   @override
//   State<OtpAuth> createState() => _OtpauthState();
// }
//
// class _OtpauthState extends State<OtpAuth> {
//    TextEditingController otpController=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OTP Auth"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: TextField(
//               controller: otpController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: "Enter the otp",
//                 suffixIcon: Icon(Icons.phone),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 )
//               ),
//             ),
//           ),
//           SizedBox(height: 30,),
//           ElevatedButton(onPressed: ()async {
//     try {
//     PhoneAuthCredential credential =
//     await PhoneAuthProvider.credential(
//     verificationId: widget.verficationid,
//     smsCode: otpController.text.toString());
//     FirebaseAuth.instance.signInWithCredential(credential).then((value){
//     Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
//     });
//     } catch (ex) {
//     log(ex.toString());
//     }
//     }, child:Text("Enter Otp"), )
//         ],
//       ),
//     );
//   }
// }
