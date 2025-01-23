import 'package:dio/dio.dart';

class Api {
  final dio = Dio();

  final baseUrl = 'https://happydonorsdev.devdemo.tech/api';

  requestotp(phonecontroller) async {
    print("i need otp" + phonecontroller);
    var response = await dio.post('${baseUrl}/auth/request-otp',
        data: {"phone_number": phonecontroller});

    print(response.data);
    return response.data;
  }

  verifyotp(pinController) async {
    print("i need otp " + pinController);
    var response = await dio
        .post('${baseUrl}/auth/verify-otp', data: {"otp_code": pinController});

    print(response.data);
    return response.data;
  }

  dashboard() async {
    var response = await dio.get('${baseUrl}/dashboard');

    return response.data;
  }

  profile() async {
    var response = await dio.get('${baseUrl}/todos');

    return response.data;
  }
}
