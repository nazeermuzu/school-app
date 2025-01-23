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

  verifyotp(pinController, phonecontroller) async {
    print("i need a otp" + pinController);
    var response;
    try {
      response = await dio.post('${baseUrl}/auth/verify-otp',
          data: {"phone_number": phonecontroller, "otp_code": pinController});
    } catch (e) {
      DioException exception = e as DioException;
      print(exception.response);
    }

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
