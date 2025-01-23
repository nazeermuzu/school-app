//
// import 'package:flutter/material.dart';
// import 'package:stream_video_flutter/stream_video_flutter.dart';
//
// import 'homeScreen.dart';
//
// Future<void> main() async {
//   // Ensure Flutter is able to communicate with Plugins
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize Stream video and set the API key for our app.
//   StreamVideo(
//     'mmhfdzb5evj2',
//     user: const User(
//       info: UserInfo(
//         name: 'John Doe',
//         id: 'Plo_Koon',
//       ),
//     ),
//     userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL1Bsb19Lb29uIiwidXNlcl9pZCI6IlBsb19Lb29uIiwidmFsaWRpdHlfaW5fc2Vjb25kcyI6NjA0ODAwLCJpYXQiOjE3MzU3OTUzNTAsImV4cCI6MTczNjQwMDE1MH0.gsDFjoYXCdhSHIhiVeqU1LReg6nGTXq5j-QQthCaLFU',
//   );
//
//   runApp(
//     MaterialApp(
//       home: HomeScreen(),
//     ),
//   );
// }