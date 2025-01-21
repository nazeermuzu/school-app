// import 'package:flutter/material.dart';
//
// class StudyScreen extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         centerTitle: true,
//         leading: Container(
//           margin: EdgeInsets.all(10),
//           //  margin: EdgeInsets.only(top: 50),
//           decoration: BoxDecoration(border:Border.all(color: Colors.black),borderRadius:BorderRadius.circular(7) ),
//           height: 40,
//           width: 50,
//           child: Icon(Icons.arrow_back_ios_new_outlined),
//         ),
//         actions: [
//             Container(
//               margin: EdgeInsets.all(10),
//
//               decoration: BoxDecoration(border:Border.all(color: Colors.black),borderRadius:BorderRadius.circular(7) ),
//               height: 40,
//               width: 40,
//               child: Icon(Icons.favorite_border),
//             )
//
//         ],
//         title: Text("Course Overview",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           )
//             ),
//       ),
//       body: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (context,i){
//           return Padding(padding: const EdgeInsets.all(28.0),
//           child: Column(
//            // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(20),
//                    child: Image.network(
//                      "assets/image/stimage.png",
//                      fit: BoxFit.fill,
//                      width: MediaQuery.of(context).size.width-56,
//                     height:280,
//                    ),
//                  ),
//                ],
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Text("React Front To Back",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight:FontWeight.bold,
//                 fontSize: 20,
//               ) ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   //  margin: EdgeInsets.only(top: 50),
//                   decoration: BoxDecoration(borderRadius:BorderRadius.circular(7) ),
//                   height: 20,
//                   width: 180,
//                   child:Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.access_time_outlined,
//                       color: Colors.grey,),
//                       Text("6h 30min . 7 lessons"),
//                     ],
//                   ) ,
//                 ),
//                  Container(
//                    margin: EdgeInsets.all(10),
//                    //  margin: EdgeInsets.only(top: 50),
//                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(7)),
//                    height: 20,
//                    width: 60,
//                    child:Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Icon(Icons.star,
//                          color: Colors.orangeAccent,),
//                        Text("4.9",
//                        style:TextStyle(
//                          color: Colors.redAccent,
//                        ) ),
//                      ],
//                    ) ,
//                  )
//
//                 ],
//               ),
//               Row(
//                 children: [
//                    // TabBarView(children: <Widget> )
//                 ],
//               )
//             ],
//           ),
//
//
//
//           );
//         },
//       )
//     );
//
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<StudyScreen> with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'Lessons'),
    Tab(text: 'Description'),
    // Tab(text: 'fixed'),
  ];
  TabController? _tabController;
  ScrollController? _scrollController;
  bool? fixedScroll;

  Widget _buildCarousel() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "assets/image/stimage.png",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width-56,
                height:280,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Text(((response["course_detail"] as Map)["title"]),
            style: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
              fontSize: 20,
            ) ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              //  margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(7) ),
              height: 20,
              width: 180,
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.access_time_outlined,
                    color: Colors.grey,),
                  Text(((response["course_detail"]as Map)["time"])),
                ],
              ) ,
            ),
            Container(
              margin: EdgeInsets.all(10),
              //  margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(7)),
              height: 20,
              width: 60,
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.star,
                    color: Colors.orangeAccent,),
                  Text(((response["course_detail"]as Map)["ratings"]),
                      style:TextStyle(
                        color: Colors.redAccent,
                      ) ),
                ],
              ) ,
            ),
          ],
        ),
      ],
    );

  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _scrollController!.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll!) {
      _scrollController!.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController!.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.linear,
    );

    setState(() {
      fixedScroll = _tabController!.index == 2;
    });
  }

  _buildTabContext() => Container(
    child: ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: ((response["course_detail"] as Map)["lessons"] as List).length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor:(Colors.orange),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            title:Text(((response["course_detail"] as Map)["lessons"] as List)[index]["tittle"]!,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
            subtitle: Text(((response["course_detail"] as Map)["lessons"] as List)[index]["time"]!),
            trailing: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_forward_ios_outlined),color: Colors.orange,),
        );
      },
    ),
  );
  
        

  var response = {

    "course_detail" : {
      "title" : "React Front To Back",
      "desc" : "The importance of a well-written course description cannot be overstated."
          " A great course description not only informs but also attracts the right audience. "
          "Think of it as the front door to your educational offering—it needs to be inviting, clear, and engaging."
          " A great description can help you build trust with prospective students, making them feel confident in their decision to enroll."
          " This is especially true for online courses, where the physical connection between students and instructors is missing. "
          "Students need to feel assured that the course will meet their expectations and provide real value.",
      "time" : "6hr 30min.7 lessons",
      "image" : "",
      "lesson_count" : "",
      "ratings" : "",
      "lessons" : [
        {
          "tittle":"Introduction to React",
          "time":"04:28 min",
        },
        {
          "tittle":"Understanding React",
          "time":"06:12 min",
        },
        {
          "tittle":"Create first React project",
          "time":"43:58 min",
        },
        {
          "tittle":"Build React",
          "time":"26:18 min",
        }
      ],

    }
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.all(10),
          //  margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(border:Border.all(color: Colors.black),borderRadius:BorderRadius.circular(7) ),
          height: 40,
          width: 50,
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),

            decoration: BoxDecoration(border:Border.all(color: Colors.black),borderRadius:BorderRadius.circular(7) ),
            height: 40,
            width: 40,
            child: Icon(Icons.favorite_border),
          )

        ],
        title: Text("Course Overview",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )
        ),

      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(child: _buildCarousel()),
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: myTabs,
              ),
            ),

          ];
        },
        body: Container(
          child: TabBarView(
            controller: _tabController,
            children: [_buildTabContext(),Text(((response["course_detail"]as Map)["desc"])),

            ],
          ),
        ),
      ),
    );
  }
}