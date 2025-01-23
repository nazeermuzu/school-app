// import 'package:flutter/material.dart';
//
// import 'int.dart';
//
//
// class Login extends StatelessWidget{
//
//   final a=TextEditingController();
//   final passwordController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//           mainAxisAlignment:MainAxisAlignment.center,
//           children: [
//             Text("log In",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 5,
//                   wordSpacing: 10,
//
//                   shadows: [
//                     Shadow(color: Colors.black,blurRadius: 10)
//                   ]
//               ),),
//             SizedBox(
//               height: 20,
//             ),
//
//             TextField(
//
//               controller: a,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius:BorderRadius.horizontal(right: Radius.circular(100),left: Radius.circular(100))
//
//                   ),
//                   hintText:"Name"
//
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: passwordController,
//
//
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius:BorderRadius.horizontal(right: Radius.circular(100),left: Radius.circular(100))
//                   ),
//                   hintText:"Password"
//               ),
//
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//
//               onPressed: (){
//                 if(a.text.isNotEmpty && passwordController.text.isNotEmpty){
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: Text(a.text),
//                         content: Text(passwordController.text),
//
//                         actions: <Widget>[
//
//                           TextButton(
//
//                             onPressed: Navigator.of(context).pop,
//
//                             child: const Text("Close"),
//                           ),
//                           TextButton(
//
//                             onPressed: (){
//
//                               Navigator.push(context,MaterialPageRoute(builder:(c)=>(Counter(text1:a.text,text2:passwordController.text))));
//                       },
//                             child: const Text("Next"),
//                           ),
//
//                         ],
//                       );
//
//                     },
//                   );
//
//                 }else{
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("username and password is required")));
//                 }
//               },
//
//               child: Text("sumit"),
//
//             ),
//           ]
//
//       ),
//
//
//     );
//   }
// }
//
//
