import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "orderhistory.dart";




class MyApp6 extends StatelessWidget {
  const MyApp6 ({Key? key}) : super(key: key);
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Birthdays(),
    );
  }
}
class Birthdays extends StatelessWidget {
  const Birthdays({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",),
      ),
      body: const Center(
        child: Icon(
          Icons.cake,
          size: 120.0,
          color: Colors.orange,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 140,
              width: 140,
              alignment: Alignment.topCenter,
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/APGschool.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Welcome Athief',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text("My Profile",
              style: TextStyle(
                color: Colors.grey
              ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(

            ),
            ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text("Order History",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Mood(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.check_outlined),
              title: Text("Ckeckout",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.heart_broken_outlined),
              title: Text("About APG",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("Admission Policy",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.control_point_duplicate),
              title: Text("Terms & Condition",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("Contact Us",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BirthDate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.work_history_outlined),
              title: Text("Enquiry",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Note(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),


          ],
        ),
      ),
    );
  }
}
class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("‘Note’"),
      ),
      body: Center(
        child: Icon(
          Icons.note_add,
          size: 120.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
class BirthDate extends StatelessWidget {
  const BirthDate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("‘Birth Date’"),
      ),
      body: Center(
        child: Icon(
          Icons.date_range,
          size: 120.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}