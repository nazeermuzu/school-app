import 'package:dio/dio.dart';

class Api{
  final dio = Dio();

  final baseUrl = 'https://jsonplaceholder.typicode.com';
  login() async {
    var response = await dio.post('${baseUrl}/login');


    return response.data;
  }

  register() async {
    var response = await dio.post('${baseUrl}/register');


    return response.data;
  }

  dashboard() async {
    var response = await dio.get('${baseUrl}/todos');


    return response.data;
  }

  profile() async {
    var response = await dio.get('${baseUrl}/todos');


    return response.data;
  }
}
