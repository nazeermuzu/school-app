import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  var data = [
    {
      "title" : "React Front To back Master React (7 lessons)",
      "time" : "6h 30 mins",
      "rating" :"4.9",
    },
    {
      "title" : "Flutter Front To back Master React (8 lessons)",
      "time" : "8h 30 mins",
      "rating" :"4.9",
    },
    {
      "title" : "AR/VR Front To back Master React (7 lessons)",
      "time" : "6h 20 mins",
      "rating" :"4.9",
    },
  ];



  Widget appBar(){
    return  Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Alex",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 3,
                  wordSpacing: 10,
                ),),
              Text("Find your lessons today ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  letterSpacing: 3,
                  wordSpacing: 10,
                ),)
            ]  ),
        SizedBox(width: 120),

        IconButton
          (onPressed:(){}, icon:Icon(Icons.notification_add)),

      ], );

  }

  Widget searchBar(){
    return Row(
      children: [
        Expanded(child: const SizedBox(
          height: 58.8,

          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(horizontal:18),
              border: OutlineInputBorder(),
              hintText: "search",
            ),
          ),
        ),),
        IconButton(onPressed: (){}, icon: Icon(Icons.settings_backup_restore,color:Colors.orangeAccent ,)),
      ],
    );
  }

  Widget centerSection(context){
    return
      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width-16,
            height: 150,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("we just don't give our students only lecture but real life experience ",
                  style:TextStyle(color: Colors.white,fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed:(){},style:ElevatedButton.styleFrom(backgroundColor:Colors.orange),child: Text("Explors courses",style: TextStyle(color: Colors.white),), ),
                    ElevatedButton(onPressed:(){},style:ElevatedButton.styleFrom(backgroundColor:Colors.orange), child: Text("Start learning",style:TextStyle(color: Colors.white), ),),
                  ],
                )
              ],),
          ),
        ],
      );
  }
  Widget courseItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured courses",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 3,
                wordSpacing: 10,
              ),
            ),

            Text(
              "see All",
              style: TextStyle(color: Colors.blue,
                  fontSize: 15,
                  fontWeight:FontWeight.bold ),
            ),
          ],
        ),
        Text(
          "Boost your global skills and career with HiStudy.",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 15,
            letterSpacing: 2,
          ),
        ),
        // No Expanded around ListView.builder
        Container(
          height: 320, // Adjust height as needed
          child: ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 250,
                        height: 300,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/image/frame1.png',
                                  fit: BoxFit.cover,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.heart_broken),
                                  color: Colors.white,
                                  padding: EdgeInsets.only(left: 160.0, top: 8.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              data[index]["title"]!,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.20,
                                wordSpacing: 2,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse_outlined,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      data[index]["time"]!,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(width:50,),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                    Text(
                                      data[index]["rating"]!,
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(

          children: [
            appBar(),
            searchBar(),
            centerSection(context),
            courseItem(),
            courseItem(),
          ],
        ),
      ),
    );


  }

}