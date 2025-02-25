// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// _MyHomePageState
// class _MyHomePageState extends State<MyHomePage> {
//   late File _image;
//   final picker = ImagePicker();
//
//   //Image Picker function to get image from gallery
//   Future getImageFromGallery() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });path
//   }
//   //Image Picker function to get image from camera
//   Future getImageFromCamera() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }
//   //Show options to get image from camera or gallery
//   Future showOptions() async {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (context) => CupertinoActionSheet(
//         actions: [
//           CupertinoActionSheetAction(
//             child: Text('Photo Gallery'),
//             onPressed: () {
//               // close the options modal
//               Navigator.of(context).pop();
//               // get image from gallery
//               getImageFromGallery();
//             },
//           ),
//           CupertinoActionSheetAction(
//             child: Text('Camera'),
//             onPressed: () {
//               // close the options modal
//               Navigator.of(context).pop();
//               // get image from camera
//               getImageFromCamera();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Column(
//         children: [
//           TextButton(
//             child: Text('Select Image'),
//             onPressed: showOptions,
//           ),
//           Center(
//             child: _image == null ? Text('No Image selected') : Image.file(_image),
//           ),
//         ],
//       ),
//     );
//   }
// }