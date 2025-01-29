import 'package:flutter/material.dart';

import '../../api/api.dart';

class Gmap extends StatefulWidget {
  const Gmap({super.key});

  @override
  State<Gmap> createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
  List requests = [];
  bool isApiHit = false;

  void initState() {
    super.initState();
    Api().orderhistory().then((data) {
      requests = data["banners"];

      setState(() {
        isApiHit = true;
      });
    }).catchError((e) {
      setState(() {
        isApiHit = true;
      });
    });
  }

  @override
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
          "Contact information",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body //isApiHit == false
          //     ? Center(child: CircularProgressIndicator())
          //     : requests.isEmpty
          //         ? Text("No data found")
          : Column(children: [
        Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.blueAccent[100],
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("APG School")],
              ),
            ))
      ]),
    );
  }
}
