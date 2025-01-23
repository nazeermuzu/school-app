// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
//
// class Data extends StatefulWidget {
//   const Data({super.key});
//
//   @override
//   State<Data> createState() => _DataState();
// }
//
// class _DataState extends State<Data> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title:   const Text("data screen"),
//         ),
//         body: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("database").snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return  const Center(child: CircularProgressIndicator());
//               }
//               else if (snapshot.hasError) {
//                 return Center(child: Text("${snapshot.error}"));
//               }
//               else {
//                 return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data?.size,
//                     itemBuilder: (context, index) {
//                       return Padding(padding:  const EdgeInsets.all(28.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   height: 50,
//                                   width: 50,
//                                   child: CircleAvatar(
//                                     child: Image.asset(
//                                       "assets/image/user1.png", fit: BoxFit.fill,),
//                                   ),
//                                 ),
//                                  const SizedBox(
//                                   width: 18,
//                                 ),
//                                  Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                   Text("${snapshot.data!.docs[index]["name"]}"),
//
//                                     Text("${snapshot.data!.docs[index]["school"]}"),
//                                   ],
//                                 )
//                               ],
//                             ),
//                            Column(
//                               children: [
//                              Text("${snapshot.data!.docs[index]["DOB"]}"),
//                               ],
//                             )
//                           ],
//                         ),
//
//
//                       );
//                     }
//                 );
//               }
//             })
//     );
//   }
// }
