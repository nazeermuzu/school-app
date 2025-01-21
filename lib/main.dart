import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:new1_project/listView.dart';
// import 'package:new1_project/phoneauth.dart';
// import 'package:new1_project/streamhome.dart';

import 'Push.dart';
import 'firebase_data.dart';
import 'homeScreen.dart';
import 'image_picker.dart';
import 'listView.dart';
import 'otpauth.dart';
import 'phoneauth.dart';

Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await Firebase.initializeApp(
       name: "flutter Otp Auth",
       options: const FirebaseOptions(
           apiKey: "AIzaSyD0DDISvce1mPifKZy_MWtkSMoQ-yibd3Y",
           appId: "1:698988468292:android:3f1f28aecdf0b9e7cec411",
           messagingSenderId: "698988468292",
           projectId: "flutter-otp-auth-3b594",
           storageBucket: "flutter-otp-auth-3b594.firebasestorage.app",
           authDomain: "flutter Otp Auth.firebaseapp.com"

       ));
     // await NotificationService.instance.initialize();


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:PhoneAuth(),
  ));

}

class push extends StatefulWidget {
  const push({super.key});

  @override
  State<push> createState() => _pushState();
}

class _pushState extends State<push>{
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Push Notification",
            style: TextStyle(
              fontSize: 25,

            ),
          ),
        ),
      ),
    );
  }
}


