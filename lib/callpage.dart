// import 'package:flutter/material.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
//
// class CallPage extends StatelessWidget {
//   const CallPage({Key? key, required this.callID, required this.userId, required this.userName}) : super(key: key);
//   final String callID;
//   final String userId;
//   final String userName;
//
//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCall(
//       appID: 683784081,
//       appSign: "2a7442e9d7ebdc951f5bf445d225ffa8b672c76b50c65c6b7d971fef7c41c50d",
//       userID: userId,
//       userName: userName,
//       callID: callID,
//       config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
//       // ..onOnlySelfInRoom = (context) =>Navigator.of(context).pop(),
//     );
//   }
// }