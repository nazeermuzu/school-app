// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// @pragma("vm:entry-point")
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message)async{
//   await NotificationService.instance.setupFlutterNotifications();
//   await NotificationService.instance.showNotification(message);
// }
//
// class NotificationService{
//   NotificationService._();
//   static final NotificationService instance =   NotificationService._();
//   final _messaging = FirebaseMessaging.instance;
//   final _localNotifications =  FlutterLocalNotificationsPlugin();
//   bool _isFlutterLocalNotificationsInitialized = false;
//
//   Future<void> initialize()async{
//
//     await _requestPermission();
//     await _setupMessageHandlers();
//
//   }
//
//   Future<void> _requestPermission() async{
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print("Permission status : ${settings.authorizationStatus}");
//   }
//   Future<void> setupFlutterNotifications()async {
//     if(_isFlutterLocalNotificationsInitialized) {
//       return;
//     }
//     const channel = AndroidNotificationChannel(
//       "high_importance_channel",
//       "high Importance Notifications",
//       description: "this channel is used for importance notification.",
//       importance: Importance.high,
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     const intializationSettingsAndroid =
//     AndroidInitializationSettings("@mipmap/ic_launcher");
//     //
//     // final initializationSettingDarwin = DarwinInitializationSettings(
//     //   onDidReceiveLocalNotification:(id,title,body,payload) async{
//     //
//     //   },
//     // );
//
//     final initializationSettings = InitializationSettings(
//       android: intializationSettingsAndroid,
//     );
//     await _localNotifications.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: (details){
//
//       },
//     );
//     _isFlutterLocalNotificationsInitialized=true;
//
//
//   }
//
//   Future<void> showNotification(RemoteMessage message) async{
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android =message.notification?.android;
//     if(notification!= null && android!= null){
//       await _localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//               "high importance channel",
//               "high Importance Notifications",
//               channelDescription:
//               "this channel is used for channel notification.",
//               importance: Importance.high,
//               priority: Priority.high,
//               icon: "@mipmap/ic_launcher"
//           ),
//         ),
//         payload: message.data.toString(),
//       );
//
//     }
//   }
//
//   Future<void> _setupMessageHandlers()async{
//
//
//     FirebaseMessaging.onMessage.listen((message){
//       showNotification(message);
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
//
//     final initialMessage =await _messaging.getInitialMessage();
//     if (initialMessage !=null){
//       _handleBackgroundMessage(initialMessage);
//     }
//
//     FirebaseMessaging.instance.getToken().then((str){
//       print("gnToken : $str");
//     });
//
//   }
//
//   // GlobalKey key = GlobalKey()
//   void _handleBackgroundMessage(RemoteMessage message){
//
//
//     // print(message.toMap());
//     if (message.data["to"]=="login"){
//
//       // Navigator.push(key.currentState!.context, MaterialPageRoute(builder: (_)//asdliahsdh))
//     }
//   }
// }