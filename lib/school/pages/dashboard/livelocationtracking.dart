import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// class LiveLocation extends StatefulWidget {
//   final String userId;
//   LiveLocation({required this.userId});
//
//   @override
//   _LiveLocationState createState() => _LiveLocationState();
// }
//
// class _LiveLocationState extends State<LiveLocation> {
//   final DatabaseReference _databaseRef = FirebaseDatabase.instanceFor(
//       app: Firebase.app(),
//       databaseURL: "https://flutter-otp-auth-3b594-default-rtdb.firebaseio.com/"
//   ).ref("locations/user1");
//   GoogleMapController? _mapController;
//   LatLng? _currentLocation;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     requestLocationPermissions();
//     listenForLocationUpdates();
//     startLocationUpdates();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   // Request location permissions
//   Future<void> requestLocationPermissions() async {
//     var status = await Permission.location.request();
//     if (!status.isGranted) {
//       print("⚠️ Location permission denied. Asking again...");
//       await openAppSettings();
//     }
//   }
//
//   // Get current location
//   Future<Position?> getCurrentLocation() async {
//     try {
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) throw '⚠️ Location services are disabled.';
//
//       return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     } catch (e) {
//       print("❌ Error getting location: $e");
//       return null;
//     }
//   }
//
//   // Send location to Firebase
//   void sendLocationToFirebase(double latitude, double longitude) {
//     String path = "locations/${widget.userId}";
//     print("📡 Uploading to: $path");
//
//     _databaseRef.child(widget.userId).set({
//       "latitude": latitude,
//       "longitude": longitude,
//       "timestamp": DateTime.now().toIso8601String(),
//     }).then((_) {
//       print("✅ Location sent successfully");
//     }).catchError((error) {
//       print("❌ Firebase Error: $error");
//     });
//   }
//
//
//   // Listen for location updates from Firebase
//   void listenForLocationUpdates() {
//     _databaseRef.child(widget.userId).onValue.listen((event) {
//       var snapshot = event.snapshot;
//
//       if (snapshot.value != null) {
//         try {
//           var locationData = Map<String, dynamic>.from(snapshot.value as Map);
//           double latitude = locationData["latitude"] ?? 0.0;
//           double longitude = locationData["longitude"] ?? 0.0;
//
//           if (latitude != 0.0 && longitude != 0.0) {
//             setState(() {
//               _currentLocation = LatLng(latitude, longitude);
//             });
//             updateMap(latitude, longitude);
//           }
//         } catch (e) {
//           print("❌ Error processing location data: $e");
//         }
//       }
//     });
//   }
//
//   // Update the map only if needed
//   void updateMap(double latitude, double longitude) {
//     if (_currentLocation == null || (_currentLocation!.latitude != latitude || _currentLocation!.longitude != longitude)) {
//       _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: LatLng(latitude, longitude),
//         zoom: 14,
//       )));
//     }
//   }
//
//   // Start periodic location updates
//   void startLocationUpdates() {
//     _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
//       Position? position = await getCurrentLocation();
//       if (position != null) {
//         sendLocationToFirebase(position.latitude, position.longitude);
//       }
//     });
//   }
//
//   // Share Firebase tracking link
//   void shareLocation() {
//     String googleMapsUrl = "https://www.google.com/maps?q=${_currentLocation?.latitude},${_currentLocation?.longitude}";
//
//     print("🔗 Sharing Google Maps URL: $googleMapsUrl"); // Debugging
//     Share.share("📍 Track my live location: $googleMapsUrl");
//   }
//
//   void openInGoogleMaps(double latitude, double longitude) async {
//     String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
//
//     if (await canLaunch(googleMapsUrl)) {
//       await launch(googleMapsUrl);
//     } else {
//       print("❌ Could not open Google Maps");
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Location Tracking'),
//         actions: [IconButton(icon: Icon(Icons.share), onPressed: shareLocation)],
//       ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         myLocationEnabled: true,
//         compassEnabled: true,
//         onMapCreated: (controller) => _mapController = controller,
//         initialCameraPosition: CameraPosition(target: _currentLocation ?? LatLng(0, 0), zoom: 14),
//         markers: _currentLocation != null
//             ? {Marker(markerId: MarkerId(widget.userId), position: _currentLocation!)}
//             : {},
//       ),
//     );
//   }
// }
//
// // ========================== TRACK ANOTHER USER'S LOCATION ========================== //
// class TrackUserLocation extends StatefulWidget {
//   final String trackUserId;
//   TrackUserLocation({required this.trackUserId});
//
//   @override
//   _TrackUserLocationState createState() => _TrackUserLocationState();
// }
//
// class _TrackUserLocationState extends State<TrackUserLocation> {
//   final DatabaseReference _databaseRef = FirebaseDatabase.instanceFor(
//       app: Firebase.app(),
//       databaseURL: "https://flutter-otp-auth-3b594-default-rtdb.firebaseio.com/"
//   ).ref("locations/user1");
//   GoogleMapController? _mapController;
//   LatLng? _trackedLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     listenForLocationUpdates();
//   }
//
//   // Listen for live location updates of another user
//   void listenForLocationUpdates() {
//     _databaseRef.child(widget.trackUserId).onValue.listen((event) {
//       var snapshot = event.snapshot;
//
//       if (snapshot.value != null) {
//         try {
//           var locationData = Map<String, dynamic>.from(snapshot.value as Map);
//           double latitude = locationData["latitude"] ?? 0.0;
//           double longitude = locationData["longitude"] ?? 0.0;
//
//           if (latitude != 0.0 && longitude != 0.0) {
//             setState(() {
//               _trackedLocation = LatLng(latitude, longitude);
//             });
//             updateMap(latitude, longitude);
//           }
//         } catch (e) {
//           print("❌ Error processing location data: $e");
//         }
//       }
//     });
//   }
//
//   // Update the map with the tracked user's location
//   void updateMap(double latitude, double longitude) {
//     if (_trackedLocation == null || (_trackedLocation!.latitude != latitude || _trackedLocation!.longitude != longitude)) {
//       _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: LatLng(latitude, longitude),
//         zoom: 14,
//       )));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tracking User ${widget.trackUserId}')),
//       body: GoogleMap(
//         myLocationEnabled: true,
//         compassEnabled: true,
//         mapType: MapType.normal,
//         onMapCreated: (controller) => _mapController = controller,
//         initialCameraPosition: CameraPosition(target: _trackedLocation ?? LatLng(0, 0), zoom: 14),
//         markers: _trackedLocation != null
//             ? {Marker(markerId: MarkerId(widget.trackUserId), position: _trackedLocation!)}
//             : {},
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Location Tracking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LiveLocation(userId: "user2"), // Change to dynamic user ID if needed
    );
  }
}

// ========================== LIVE LOCATION TRACKING ========================== //
class LiveLocation extends StatefulWidget {
  final String userId;
  LiveLocation({required this.userId});

  @override
  _LiveLocationState createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref("locations");
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  Map<String, dynamic>? user2;

  @override
  void initState() {
    super.initState();
    requestLocationPermissions();
    listenForLocationUpdates();
    startLocationUpdates();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Request location permissions
  Future<void> requestLocationPermissions() async {
    var status = await Permission.location.request();
    if (!status.isGranted) {
      print("Location permission denied");
    }
  }

  // Get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  // Send location to Firebase in real-time
  void sendLocationToFirebase(double latitude, double longitude) {
    _databaseRef.child(widget.userId).set({
      "latitude": latitude,
      "longitude": longitude,
      "timestamp": DateTime.now().toIso8601String(),
    });
  }
  void listenAnotherUser() {
    _databaseRef.child("user1").onValue.listen((event){
      var snapshot = event.snapshot;

      user2 = Map<String, dynamic>.from(snapshot.value as Map);
      print(user2);
      _mapController?.animateCamera(CameraUpdate.newLatLng(LatLng(user2!["latitude"], user2!['longitude'])));

      setState(() {

      });
    });
  }

  // Listen for location updates from Firebase
  void listenForLocationUpdates() {
    _databaseRef.child(widget.userId).onValue.listen((event) {
      var snapshot = event.snapshot;

      if (snapshot.value != null) {
        var locationData = Map<String, dynamic>.from(snapshot.value as Map);

        double? latitude = locationData["latitude"]?.toDouble();
        double? longitude = locationData["longitude"]?.toDouble();

        if (latitude != null && longitude != null) {
          setState(() {
            _currentLocation = LatLng(latitude, longitude);
          });
          updateMap(latitude, longitude);
        }
      }
    });
  }

  // Update map to follow user in real-time
  void updateMap(double latitude, double longitude) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
  }

  // Continuously update location in Firebase (Live Tracking)
  void startLocationUpdates() {
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 5),
    ).listen((Position position) {
      if (position != null) {
        sendLocationToFirebase(position.latitude, position.longitude);
        listenAnotherUser();
      }
    });
  }

  // Share tracking link
  void shareLocation() {
    String locationUrl = "https://flutter-otp-auth-3b594-default-rtdb.firebaseio.com/${widget.userId}.json";
    Share.share("Track my live location: $locationUrl");
  }

  // Open location in Google Maps
  void openInGoogleMaps() {
    if (_currentLocation != null) {
      final url = "https://www.google.com/maps/search/?api=1&query=${_currentLocation!.latitude},${_currentLocation!.longitude}";
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location Tracking'),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: shareLocation),
          IconButton(icon: Icon(Icons.map), onPressed: openInGoogleMaps),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (controller) => _mapController = controller,
        initialCameraPosition: CameraPosition(target: _currentLocation ?? LatLng(0, 0), zoom: 14),
        markers: _currentLocation != null
            ? {
          Marker(markerId: MarkerId(widget.userId), position: _currentLocation!),
          if(user2 !=null) Marker(markerId: MarkerId("user2"), position: LatLng(user2!["latitude"], user2!["longitude"])!),
        }
            : {},
      ),
    );
  }
}

