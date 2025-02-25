import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:translator/translator.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../api/api.dart';

class Gmap2 extends StatefulWidget {
  const Gmap2({super.key});

  @override
  State<Gmap2> createState() => _Gmap2State();
}

class _Gmap2State extends State<Gmap2> {
  List requests = [];
  List originalRequests = []; // Store original English text
  bool isApiHit = false;
  bool isMapExpanded = false;
  GoogleMapController? mapController;
  final translator = GoogleTranslator();
  bool isTamil = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      final data = await Api().orderhistory();
      if (data != null && data["requests"] != null) {
        setState(() {
          requests = data["requests"];
          originalRequests = List.from(requests); // Store original data
          isApiHit = true;
        });
      } else {
        setState(() {
          isApiHit = true;
          requests = [];
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
    const url = 'tel:';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Could not launch dialer");
    }
  }

  void _openGoogleMaps(double latitude, double longitude) async {
    final googleMapsUrl = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      print("Could not open Google Maps");
    }
  }

  void _translatePage() async {
    if (isTamil) {
      // Restore original English text
      setState(() {
        requests = List.from(originalRequests);
        isTamil = false;
      });
    } else {
      // Translate to Tamil
      List translatedRequests = [];
      for (var request in originalRequests) {
        var translatedRequest = {
          "attender_name":
              (await translator.translate(request["attender_name"], to: 'ta'))
                  .text,
          "date": (await translator.translate(request["date"], to: 'ta')).text,
          "attender_mobile_number": request["attender_mobile_number"],
          // No translation needed
          "address":
              (await translator.translate(request["address"], to: 'ta')).text,
          "patient_name":
              (await translator.translate(request["patient_name"], to: 'ta'))
                  .text,
          "lat": request["lat"],
          "lon": request["lon"],
        };
        translatedRequests.add(translatedRequest);
      }
      setState(() {
        requests = translatedRequests;
        isTamil = true;
      });
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
        title: Text(
          isTamil ? "தொடர்பு தகவல்" : "Contact Information",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: isApiHit == false
          ? const Center(child: CircularProgressIndicator())
          : requests.isEmpty
              ? Center(
                  child: Text(
                    isTamil ? "தரவு கிடைக்கவில்லை" : "No data found",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: requests.length > 2 ? 2 : requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    var latitude =
                        double.tryParse(request["lat"]?.toString() ?? "");
                    var longitude =
                        double.tryParse(request["lon"]?.toString() ?? "");

                    if (latitude == null || longitude == null) {
                      return Center(
                        child: Text(
                          isTamil
                              ? "தவறான ஒருங்கிணைப்புகள்"
                              : "Invalid coordinates found",
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        "${request["patient_name"]}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "${request["address"]}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _openGoogleMaps(latitude, longitude);
                                  },
                                  child: SizedBox(
                                    height: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: GoogleMap(
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(latitude, longitude),
                                          zoom: 14,
                                        ),
                                        markers: {
                                          Marker(
                                            markerId:
                                                const MarkerId('marker Id'),
                                            position:
                                                LatLng(latitude, longitude),
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
                                IconButton(
                                  icon: const Icon(Icons.phone,
                                      color: Colors.blue),
                                  onPressed: _launchDialer,
                                ),
                              ]),
                        ),
                      ],
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _translatePage,
        child: Icon(
          Icons.translate,
          color: Colors.black,
        ),
      ),
    );
  }
}
