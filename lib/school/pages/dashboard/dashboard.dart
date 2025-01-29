import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:new2/school/pages/dashboard/drawer.dart";

import "orderhistory.dart";

class Birthdays extends StatefulWidget {
   Birthdays({super.key});

  @override
  State<Birthdays> createState() => _BirthdaysState();
}

class _BirthdaysState extends State<Birthdays> {
  var myWidget = [
    Text("Dashboard"),
    Mood(),

  ];

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("dashboard"),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        body: Center(
          child: myWidget[selectedIndex],
        ),
        drawer: Drawer1(receiveIndex : (index){
          selectedIndex = index;
          setState(() {
            Navigator.pop(context);
          });
          print(index);
        }));
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
