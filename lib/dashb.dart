// import "package:flutter/cupertino.dart";
// import "package:flutter/material.dart";
//
//
//
//
// class MyApp6 extends StatelessWidget {
//   const MyApp6 ({Key? key}) : super(key: key);
// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Birthdays(),
//     );
//   }
// }
// class Birthdays extends StatelessWidget {
//   const Birthdays({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard",),
//       ),
//       body: const Center(
//         child: Icon(
//           Icons.cake,
//           size: 120.0,
//           color: Colors.orange,
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               child: Container(
//
//
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text("‘Birth date’"),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => BirthDate(),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.mood),
//               title: Text("mood"),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => Mood(),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.note_add),
//               title: Text("Note"),
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => Note(),
//                 ),
//               ),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               onTap: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Note extends StatelessWidget {
//   const Note({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("‘Note’"),
//       ),
//       body: Center(
//         child: Icon(
//           Icons.note_add,
//           size: 120.0,
//           color: Colors.orange,
//         ),
//       ),
//     );
//   }
// }
// class Mood extends StatelessWidget {
//   const Mood({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("‘Mood’"),
//       ),
//       body: Center(
//         child: Icon(
//           Icons.mood,
//           size: 120.0,
//           color: Colors.orange,
//         ),
//       ),
//     );
//   }
// }
// class BirthDate extends StatelessWidget {
//   const BirthDate({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("‘Birth Date’"),
//       ),
//       body: Center(
//         child: Icon(
//           Icons.date_range,
//           size: 120.0,
//           color: Colors.orange,
//         ),
//       ),
//     );
//   }
// }