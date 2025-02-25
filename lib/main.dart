import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new2/school/pages/login/login.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyD0DDISvce1mPifKZy_MWtkSMoQ-yibd3Y",
  //     appId: "1:698988468292:android:3f1f28aecdf0b9e7cec411",
  //     messagingSenderId: "698988468292",
  //     projectId: "flutter-otp-auth-3b594",
  //     storageBucket: "flutter-otp-auth-3b594.appspot.com",
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      print("Storage Permission Granted");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      print("Storage Permission Denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(), // Set your actual home screen here
    );
  }
}

// Push Notification Screen
class PushNotificationScreen extends StatelessWidget {
  const PushNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Push Notification")),
      body: const Center(
        child: Text(
          "Push Notification",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
