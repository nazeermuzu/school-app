import 'package:flutter/material.dart';

import '../../api/api.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List notifications = [];
  bool isApiHit = false;

  void initState() {
    super.initState();
    Api().notifications().then((data) {
      notifications = data["notifications"];
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
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          title: Center(child: Text("Notifications")),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: isApiHit == false
            ? Center(child: CircularProgressIndicator())
            : notifications.isEmpty
                ? Text("No data found")
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index][""].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                    Text(notifications[index]["id"].toString()),
                                  ],
                                )),
                          )
                        ],
                      );
                    }));
  }
}
