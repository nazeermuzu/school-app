// import 'package:flutter/material.dart';
// // import 'package:new1_project/profilescreen.dart';
// // import 'package:new1_project/studiesscreen.dart';
// //
// //
// // import '../login.dart';
// import 'homescreen.dart';
// import 'profilescreen.dart';
// import 'studiesscreen.dart';
// /// Flutter code sample for [NavigationBar].
//
//
// class BottomNavigationBarExampleApp extends StatelessWidget {
//   const BottomNavigationBarExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: true),
//       home: const NavigationExample(),
//     );
//   }
// }
//
// class NavigationExample extends StatefulWidget {
//   const NavigationExample({super.key});
//
//   @override
//   State<NavigationExample> createState() => _NavigationExampleState();
// }
//
// class _NavigationExampleState extends State<NavigationExample> {
//   int currentPageIndex = 0;
//   List screens = [
//     HomeScreen(),
//     StudyScreen(),
//     ProfilScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       body: Center(
//         child: screens[currentPageIndex],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//
//           ),
//
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'course',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.file_copy),
//             label: 'file',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'profile',
//           )
//
//         ],
//         currentIndex: currentPageIndex,
//         selectedItemColor: Colors.amber[900],
//         unselectedItemColor: Colors.grey,
//         onTap: (index){
//           currentPageIndex = index;
//           setState(() {
//
//           });
//         },
//       ),
//     );
//   }
// }
