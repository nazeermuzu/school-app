// import 'package:flutter/material.dart';
//
// class ProfilScreen extends StatelessWidget {
//  var data =[
//    {
//      "title":"Setup your Grapic Des..",
//      "title1":"Digital Marketing",
//      "rattim":"4.2 | 4hr 05mins",
//    },
//    {
//      "title":"Setup your Grapic Des..",
//      "title1":"Digital Marketing",
//      "rattim":"4.2 | 4hr 05mins",
//    },
//    {
//      "title":"Web Development Conce..",
//      "title1":"Web Development",
//      "rattim":"4.7 | 5hr 18mins",
//    },
//  ];
//   Widget searchBar(){
//     return Row(
//       children: [
//         Flexible(
//             flex: 2,
//             child:TextField(
//               cursorColor: Colors.grey,
//               decoration: InputDecoration(
//                    suffixIcon: Icon(Icons.search_rounded,),
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   hintText: "Search for",
//                   hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 20
//                   )
//               ),
//             ))
//       ],
//     );
//   }
//   Widget centerSection(context){
//     return
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(
//             backgroundColor: Colors.orange,
//           ), child: Text("Completed",style: TextStyle(color: Colors.white),)),
//           SizedBox(width: MediaQuery.of(context).size.width-310,),
//           ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey
//           ), child:Text("Ongoing",style: TextStyle(color: Colors.white),))
//         ],
//       );
//   }
// Widget courseItem(context) {
//   return ListView.builder(
//       shrinkWrap: true,
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return  Container(
//           height: 142,
//           padding: EdgeInsets.all(10),
//           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white,
//           ),
//           child:
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                 BorderRadius.only(topLeft: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),),
//                 child: Image.asset("assets/image/frame1.png"),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(data[index]["title1"]!,
//                           style: TextStyle(
//                             color: Colors.orange,
//                           ),),
//                         SizedBox(width: MediaQuery
//                             .of(context)
//                             .size
//                             .width - 380,),
//                         Icon(Icons.verified, color: Colors.green,)
//                       ],
//                     ),
//                     SizedBox(height: 5,),
//                     Text(data[index]["title"]!,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),),
//                     SizedBox(height: 5,),
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.orange,),
//                         Text(data[index]["rattim"]!),
//                       ],
//                     ),
//                     SizedBox(height: 7,),
//                     Row(
//                       children: [
//                         SizedBox(width: MediaQuery
//                             .of(context)
//                             .size
//                             .width - 359,),
//                         Text("VIEW CERTIFICATE",
//                           style: TextStyle(
//                               color: Colors.green
//                           ),),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         );
//       } ); }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("My Courses",
//           style: TextStyle(
//               fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             searchBar(),
//             SizedBox(height: 20,),
//             centerSection(context),
//             courseItem(context),
//           ],
//         ),
//       ),
//     );
//   }
// }