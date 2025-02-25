import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:muzu24/school/api/api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api.dart';

class Gmap extends StatefulWidget {
  const Gmap({super.key});

  @override
  State<Gmap> createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  List requests = [];
  bool isApiHit = false;
  bool isMapExpanded = false;
  GoogleMapController? mapController; // Controller for GoogleMap

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      final data = await Api().orderhistory();

      // Check if data is not null and contains "requests"
      if (data != null && data["requests"] != null) {
        setState(() {
          requests = data["requests"];
          isApiHit = true;
        });
      } else {
        setState(() {
          isApiHit = true;
          requests = []; // In case no valid requests are found
        });
        print("No requests found or invalid response format.");
      }
    } catch (e) {
      setState(() {
        isApiHit = true;
      });
      print("Error fetching data: $e");
    }
  }

  _launchDialer() async {
    const url = 'tel:'; // Opens the dialer without specifying a number
    if (await canLaunch(url)) {
      await launch(url); // Launches the dialer
    } else {
      print("Could not launch dialer");
    }
  }

  // Function to open Google Maps with the given coordinates
  void _openGoogleMaps(double latitude, double longitude) async {
    // Format URL for Google Maps (it works on both Android and iOS)
    final googleMapsUrl = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl); // Open Google Maps app or browser
    } else {
      print("Could not open Google Maps");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          "Contact information",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: isApiHit == false
          ? const Center(child: CircularProgressIndicator())
          : requests.isEmpty
              ? const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: requests.length > 2 ? 2 : requests.length,
                  // Keeping your original itemCount logic
                  itemBuilder: (context, index) {
                    final request = requests[index];

                    // Check if lat and lon exist and are valid
                    var latitude =
                        double.tryParse(request["lat"]?.toString() ?? "");
                    var longitude =
                        double.tryParse(request["lon"]?.toString() ?? "");

                    if (latitude == null || longitude == null) {
                      return const Center(
                        child: Text(
                          "Invalid coordinates found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Card(
                          color: Colors.black54,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                          margin: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      color: Colors.blueAccent[100],
                                      height: 30,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${request["attender_name"]}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${request["date"]}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      "${request["attender_mobile_number"]}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      "${request["address"]}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      "${request["patient_name"]}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              // Google Map below the call dialer
                              GestureDetector(
                                onTap: () {
                                  // Open Google Maps with coordinates when the map is tapped
                                  _openGoogleMaps(latitude, longitude);
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: isMapExpanded ? 300 : 150,
                                  // Expand/shrink map size
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(7)),
                                    child: GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(latitude, longitude),
                                        zoom: 14,
                                      ),
                                      markers: {
                                        Marker(
                                          markerId: const MarkerId('marker Id'),
                                          position: LatLng(latitude, longitude),
                                        ),
                                      },
                                      mapType: MapType.normal,
                                      myLocationEnabled: true,
                                      compassEnabled: true,
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        mapController = controller;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // Dialer Button (Remains unchanged)
                              IconButton(
                                icon:
                                    const Icon(Icons.phone, color: Colors.blue),
                                onPressed: _launchDialer,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
