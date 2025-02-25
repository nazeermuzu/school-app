
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new2/school/api/api.dart';


class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  List requests = [];
  bool isApiHit = false;
  void initState() {
    super.initState();
    Api().orderhistory().then((data) {
      requests = data["requests"];
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
        appBar: AppBar(
          title: Text("Order History"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        // drawer: Drawer1(),
        body: isApiHit == false
            ? Center(child: CircularProgressIndicator())
            : requests.length == 0
                ? Text("No data found")
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          margin: EdgeInsets.all(16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  //("Name : ${requests[index]["name"]}")
                                  Text(
                                    ("Request_Id:  ${requests[index]["request_id"].toString()}"),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(("Name : ${requests[index]["name"]}")),
                                  Text("Lat :${requests[index]["lat"]}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(" Lon :${requests[index]["lon"]}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      "Units_Required: ${requests[index]["units_required"].toString()}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(" Date :${requests[index]["date"]}"),
                                  Text(
                                      " Loacation :${requests[index]["location"]}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(" From :${requests[index]["from"]}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(" To :${requests[index]["location"]}"),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ]);
                    }));
  }
}
