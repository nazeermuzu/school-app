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

  List requests=[];
  bool isApiHit = false;
  void initState(){
    super.initState();
    Api().orderhistory().then((data){

      requests = data["requests"];
      setState(() {
        isApiHit = true;
      });
    }).catchError((e){
      setState(() {
        isApiHit = true;

      });
    });


  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order History"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: isApiHit==false ? Center(child: CircularProgressIndicator())
            :
            requests.length == 0 ? Text("No data found") :
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return Column(
                  children:[
                    Card(
                      color: Colors.white,
                      elevation:4,
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
                                Icon(Icons.notifications,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16,),
                          Expanded(child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8,),
                              Text( requests[index]["request_id"].toString(),
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              SizedBox(height: 8,),
                              Text( requests[index]["name"],),
                              SizedBox(height: 8,),
                              Text(requests[index]["lat"]),
                              SizedBox(height: 8,),
                              Text(requests[index]["lon"]),
                              SizedBox(height: 8,),
                              Text("Transaction Amount :"),
                              SizedBox(height: 8,),
                              Text("School Approval :")


                            ],
                          )



                          ) ],
                      ),
                    ),
                  ] );
            }));
  }}