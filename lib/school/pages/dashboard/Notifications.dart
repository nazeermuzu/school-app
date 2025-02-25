import 'package:flutter/material.dart';
import '../../api/api.dart';
import 'package:timeago/timeago.dart'as timeago;


class Notifications extends StatefulWidget {
  Notifications({Key? key,}) : super(key: key);
  @override
  State<Notifications> createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {
  List notifications = [];
  bool isApiHit = false;
  @override
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Center(child: Text("Notifications")),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isApiHit == false
          ? Center(child: CircularProgressIndicator())
          : notifications.isEmpty
          ? Center(child: Text("No data found"))
          : ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          Color cardColor = notifications[index]["is_read"] == 0
              ? Colors.lightBlue.shade100
              : Colors.white;

          return GestureDetector(
            onTap: () {
              setState(() {
              notifications[index]["is_read"] = 1;
              });
                Api().markNotificationAsRead(notifications[index]["id"]);

            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: cardColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child:
                              Column(
                                children: [
                                  Text(
                                    notifications[index]["title"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              ) ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  notifications[index]["message"]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      timeago.format(
                                          DateTime.parse(notifications[
                                          index]
                                          ["created_at"])),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



