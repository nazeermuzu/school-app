import 'dart:io';

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

  Map<String, dynamic> data = {};

  orderhistory() async {
    try {
      print("URl => ${'${baseUrl}/app/blood-requests/open'}");
      var response = await dio.get('${baseUrl}/app/blood-requests/open',
          options: Options(headers: {
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
            "accept": "application/json"
          }));
      data = response.data;
      return data;
    } catch (e) {
      print("erreo${(e)}");
    }
  }

  Map<String,dynamic> data1 = {};

  notifications() async {
    try {
      //print("URl => ${'${baseUrl}/app/notifications'}");
    var response = await dio.get('${baseUrl}/app/notifications',

      options: Options(headers: {
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
        "accept": "application/json"
      }));
    return response.data;

    } catch (e) {
    print("erreo${(e)}");
    return{};
    }
  }
  Map<String,dynamic> data2 = {};

  markNotificationAsRead(int notificationId) async {
    try {

      var response = await dio.post('$baseUrl/app/notifications/mark-as-read',
          data: {"notification_id": notificationId},
          options: Options(headers: {
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
            "accept": "application/json"

          }));
      return response.data;

    } catch (e) {
      DioException exception = e as DioException;
      print(exception.response);
      return{};
    }
  }


  dashboard() async {
    try {
      print("URl => ${'${baseUrl}/app/dashboard'}");
      var response = await dio.get('${baseUrl}/app/dashboard',
          options: Options(headers: {
            "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
            "accept": "application/json"
          }));
      data = response.data;
      return data;
    } catch (e) {
      print("erreo${(e)}");
    }
  }




  getUserProfile() async {
    try {
      var response = await dio.get('$baseUrl/app/profile',
          data: data,
          options: Options(headers: {

        "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
        "accept": "application/json"
      }));
      return response.data;
    } catch (e) {
      print("Error fetching profile: $e");
      return {};
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    try {

      if (data.containsKey("blood_group")) {
        data["blood_group"] = data["blood_group"]?.toString();
      }
      if (data.containsKey("gender")) {
        data["gender"] = data["gender"]?.toString();
      }

      Response response = await dio.patch(
        '$baseUrl/app/profile/update',
        data: data,
        options: Options(headers: {
          "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
          "accept": "application/json"
        }),
      );

      print("Profile updated successfully: ${response.data}");
    } on DioException catch (e) {
      if (e.response != null) {
        print("Error updating profile: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("Request failed: ${e.message}");
      }
    }
  }


  Future<String?> uploadProfilePicture(File imageFile,) async {
    try {
 print("image file$imageFile");
      FormData formData = FormData.fromMap({
        'profile_picture': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
        ),
      });

      final response = await dio.post(
          '$baseUrl/app/profile-picture/update',
        data: formData,
        options: Options(
          headers: {
           "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNjljYzVlN2I0YjRlNzdmODUyMzcwODU5OWU1MGY3MGM1ZDE4ODNkZjU3OWQ2MzY5NmYyZTgwOGYxNTM4YjMxODQ4MWYxN2Q5MmFkMDQyZjgiLCJpYXQiOjE3Mzc3MjUzOTUuMTY5MTIzLCJuYmYiOjE3Mzc3MjUzOTUuMTY5MTI2LCJleHAiOjE3NjkyNjEzOTUuMTY3MzI1LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.EEiV7968y1tny48z4v5cGUXJ40CHcYRMCgxsiQYhorNpKLoPPYlj-JyT2lC9bdHSZ8SD2TwrdSiFOo-tcI7j4JoMEp40_nSBKyRLIzlyxrGfQKKmuKKALnTWzg4nC7au593YLNa9hQhfvJhr2nrX2UtBx3ElCo8B6t3pQNH8HW00y50p1275bw0PU7lOsNFmF4m4VoLzCgKRCyKJpBMC8fXNtIZQSUn6SvNFO6slnvz12WsnZyuPiXYi7VywrHnujEh5xq-GXMGThe-kqIt-vkBHjF15SvN9tyl57XOBlOCfdAXUrxGhobhJpMamVh9pW_7NXhEbsAr3v6oobS3WCxX_efpoTPk6qBi5Ct2ebOot6Awu0oXMC9f4oVBKuDeB69wNrAhM14vsvfQ-hFJF31wVUvTkQSt1Q44rZGnHz8DTOjQEKiIEK2YZkZctWJKCBzKUll5B3R-FLniMV3qOVuO7EsMWxU8knQ8JnGVFqsIsQtaGyIXBZDQGOzFsgO57LOYHF-WDMhh6kPXcHdneL2megj461pUFVAAW1egTVi6juevCAVq9VdBjWdIMmiWczJ_yU8TYTqO-lTZWEVosSpy__pYqjC4A1nr3TU5XKoMxzmvk3Av8AhHVpyXnzNU26m0LizSliHUN23L7HO2NzUCUqAaG6acL2c4MWJiW5S0",
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      print("response from api ${response.data}");
      return response.data;
    } catch (e) {
      print("Error  profile picture: $e");

    }
  }

}