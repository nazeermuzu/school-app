import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new2/school/pages/dashboard/Notifications.dart';

import 'package:new2/school/pages/dashboard/dashboard.dart';
import 'package:new2/apgschools.dart';
import 'package:new2/school/pages/dashboard/ContactUs.dart';
import 'package:new2/school/pages/dashboard/dashboard.dart';
import 'package:new2/school/pages/dashboard/orderhistory.dart';
import 'package:new2/school/pages/login/v2.dart';
import 'package:new2/school/pages/request.dart';

import 'apgschools.dart';


Future<void> main() async {
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
          authDomain: "flutter Otp Auth.firebaseapp.com"));
  // await NotificationService.instance.initialize();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gmap(),
    // home: Gmap(),
  ));
}

class push extends StatefulWidget {
  const push({super.key});

  @override
  State<push> createState() => _pushState();
}

class _pushState extends State<push> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Push Notification",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
