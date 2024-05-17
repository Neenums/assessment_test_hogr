import 'dart:convert';

import 'package:assessment_test_hogr/model/data_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiServices {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const headers = {
    'Content-Type': 'application/json',
    'Connection': 'keep-alive'
  };

  Future<List<DataModel>> getAllPosts() async {
    return http
        .get(
        Uri.parse(
          '$baseUrl/posts',
        ),
        headers: headers)
        .then((data) {
      final postData = <DataModel>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          postData.add(DataModel.fromJson(product));
        }
      }
      return postData;
    }).catchError((err) => print(err));
  }


  //
  // Future<void> login(String email, String password,
  //     {required void Function(bool) onSuccess,
  //       required void Function(String) onFailure}) async {
  //   try {
  //     Map<String, String> data = {
  //       "username": "mor_2314",
  //       "password": "83r5^_"
  //       // 'username': email, 'password': password
  //     };
  //     var bodyJson = jsonEncode(data);
  //     Response response = await post(Uri.parse('$baseUrl/auth/login'),
  //         headers: headers, body: bodyJson);
  //
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //
  //       print(data['token']);
  //       onSuccess(data['token'] != null);
  //       SharedPref().setToken(data['token']);
  //       String? tokenValue = await SharedPref().getToken();
  //       print(tokenValue);
  //       print('successfully');
  //     } else {
  //       onFailure(response.body.toString());
  //       print('failed');
  //     }
  //   } catch (e) {
  //     onFailure(e.toString());
  //     print(e.toString());
  //   }
  // }
}