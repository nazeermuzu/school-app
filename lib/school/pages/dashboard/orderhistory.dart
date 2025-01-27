import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new2/school/api/api.dart';
import 'package:new2/Api.dart';

class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  List banners = [];
  List recentBloodRequests = [];
  bool isApiHit = false;

  // get imageUrls => null;

  void initState() {
    super.initState();
    Api().dashboard().then((data) {
      banners = data["banners"];
      recentBloodRequests = data["recent_blood_requests"];

      setState(() {
        isApiHit = true;
      });
    }).catchError((e) {
      setState(() {
        isApiHit = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.menu), // Prefix icon
            onPressed: () {},
          ),
          title: Text(
            "dashboard",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: isApiHit == false
            ? Center(child: CircularProgressIndicator())
            : banners.isEmpty
                ? Text("No data found")
                : Column(
                    children: [
                      Container(
                        height: 200,
                        child: AnotherCarousel(
                          images: banners.map((item) {
                            return NetworkImage(item["image_url"]);
                          }).toList(),
                          autoplay: false,
                          dotSize: 6.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.black,
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.black.withOpacity(0.5),
                          borderRadius: true,
                          radius: const Radius.circular(10),
                          // Rounded corners
                          moveIndicatorFromBottom: 180.0,
                          // Adjust the position of the indicator
                          overlayShadow: false,
                          // overlayShadowColors: Colors.white,
                          // overlayShadowSize: 0.7,
                        ),
                      ),
                      ElevatedButton(
                        child: Text("How to Use"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 30),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Optional: Rounded corners
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: banners.length,
                            itemBuilder: (context, index) {
                              return Column(children: [
                                SizedBox(
                                  height: 2,
                                ),
                                Card(
                                  color: Colors.black54,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: Colors
                                          .white, // Set the border color to white
                                      width: 1, // Set the width of the border
                                    ),
                                  ),
                                  margin: EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        // Row(
                                        child: CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.grey[800],
                                            backgroundImage: NetworkImage(
                                              "${recentBloodRequests[index]["profile_picture"]}",
                                            )),
                                        // ],
                                        //   ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "${recentBloodRequests[index]["id"].toString()}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${recentBloodRequests[index]["blood_component"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "${recentBloodRequests[index]["username"]}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "${recentBloodRequests[index]["date"].toString()}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100.0),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: Size(5, 30),
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Optional: Rounded corners
                                                ),
                                              ),
                                              child: Text('View More'),
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ]);
                            }),
                      ),
                    ],
                  ));
  }
}
