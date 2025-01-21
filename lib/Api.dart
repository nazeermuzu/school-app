import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main(){
  runApp(DioApp());
}

class DioApp extends StatefulWidget{

  @override
  State<DioApp> createState() => _DioAppState();
}

class _DioAppState extends State<DioApp> {
  final dio = Dio();

  var data = [];
  var photos= [];

  void getHttp() async {
    var response = await dio.get('https://jsonplaceholder.typicode.com/todos');

    data = response.data;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(onPressed: getHttp, child: Text("Fetch")),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return Text("${data[index]["id"].toString()} ${data[index]["title"].toString()}");
                  })

            ],
          ),
        ),
      ),
    );
  }
}