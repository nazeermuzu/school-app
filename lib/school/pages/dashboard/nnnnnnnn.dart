// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class Gmap extends StatefulWidget {
//   const Gmap({super.key});
//
//   @override
//   State<Gmap> createState() => _GmapState();
// }
//
// class _GmapState extends State<Gmap> {
//   List requests = [];
//   bool isApiHit = false;
//   bool isFullScreenMap = false; // Tracks full-screen map toggle
//   GoogleMapController? _mapController;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   void _fetchData() async {
//     try {
//       // Simulating API response
//       final data = {
//         "requests": [
//           {
//             "attender_name": "John Doe",
//             "date": "2025-02-05",
//             "attender_mobile_number": "+9731234567",
//             "address": "Road 123, Block 456, Bahrain",
//             "patient_name": "Patient Name",
//             "latitude": 26.2154,
//             "longitude": 50.5832
//           }
//         ]
//       };
//
//       setState(() {
//         requests = data["requests"];
//         isApiHit = true;
//       });
//     } catch (e) {
//       setState(() {
//         isApiHit = true;
//       });
//       print("Error fetching data: $e");
//     }
//   }
//
//   _launchDialer(String number) async {
//     final url = 'tel:$number';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch dialer';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Contact Information"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: isApiHit == false
//           ? const Center(child: CircularProgressIndicator())
//           : requests.isEmpty
//           ? const Center(child: Text("No data found"))
//           : ListView.builder(
//         itemCount: requests.length,
//         itemBuilder: (context, index) {
//           final request = requests[index];
//           return Card(
//             margin: const EdgeInsets.all(16),
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Attender Name: ${request["attender_name"]}",
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 4),
//                       Text("Date: ${request["date"]}"),
//                       const SizedBox(height: 4),
//                       Text("Mobile: ${request["attender_mobile_number"]}"),
//                       const SizedBox(height: 4),
//                       Text("Address: ${request["address"]}"),
//                       const SizedBox(height: 4),
//                       Text("Patient: ${request["patient_name"]}"),
//                       const SizedBox(height: 8),
//                       IconButton(
//                         icon: const Icon(Icons.phone, color: Colors.blue),
//                         onPressed: () => _launchDialer(request["attender_mobile_number"]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Google Map inside the card
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isFullScreenMap = !isFullScreenMap;
//                     });
//                   },
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     height: isFullScreenMap
//                         ? MediaQuery.of(context).size.height * 0.8 // Full-screen height
//                         : 200, // Default map height
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                           bottom: Radius.circular(12)),
//                       child: GoogleMap(
//                         onMapCreated: (controller) {
//                           _mapController = controller;
//                         },
//                         initialCameraPosition: CameraPosition(
//                           target: LatLng(
//                             request["latitude"],
//                             request["longitude"],
//                           ),
//                           zoom: 14,
//                         ),
//                         markers: {
//                           Marker(
//                             markerId: const MarkerId('location'),
//                             position: LatLng(
//                               request["latitude"],
//                               request["longitude"],
//                             ),
//                           ),
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }