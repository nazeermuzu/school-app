import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget{
  ListViewExample({Key? key}) : super(key: key);

  List data = [
    {
      "name" : "Syed",
      "message" : "Hi syed",
      "count" : "1",
      "time" : "08:00",
      "image" : "assets/image/user1.png",
    },
    {
      "name" : "Muzzu",
      "message" : "Hi muzzu",
      "count" : "3",
      "time" : "09:00",
      "image" : "assets/image/user1.png",
    },

    {
      "name" : "Syed",
      "message" : "Hi syed",
      "count" : "1",
      "time" : "08:00",
      "image" : "assets/image/user1.png",
    },
    {
      "name" : "Muzzu",
      "message" : "Hi muzzu",
      "count" : "3",
      "time" : "09:00",
      "image" : "assets/image/user1.png",
    },
    {
      "name" : "Syed",
      "message" : "Hi syed",
      "count" : "1",
      "time" : "08:00",
      "image" : "assets/image/user1.png",
    },
    {
      "name" : "Muzzu",
      "message" : "Hi muzzu",
      "count" : "3",
      "time" : "09:00",
      "image" : "assets/image/user1.png",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(

          itemCount: data.length,
          itemBuilder: (context,i){
            return Padding(padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              child: Image.asset(data[i]["image"],fit: BoxFit.fill,),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[i]["name"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,

                                ),),
                              Text(data[i]["message"]),

                            ],
                          ),
                        ]),

                    Column(
                      children: [
                        Text(data[i]["time"]),
                        //  Text("2"),
                        Container(
                          alignment: Alignment.center,
                          child:  Text(data[i]["count"  ],
                            style: TextStyle(color: Colors.white),
                          ),

                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)
                          )
                        ),

                      ],
                    )
                  ],
                )
            );

            // return Text('${i} ${data[i]["name"]}');

          }),
    );

  }
}



