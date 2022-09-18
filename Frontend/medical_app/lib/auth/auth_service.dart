import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServic {
  static final String url = 'http://10.0.2.2:8000/api';
  static final client = http.Client();
  static Future register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    var response = await client.post(
      Uri.parse("$url/user/create_user"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
      }),
    );
    return jsonDecode(response.body);
  }

  static Future sendHealthInfo(
      {String? gender,
      int? height,
      int? weight,
      int? age,
      String? blood_type,
      String? description,
      required String token}) async {
    var response = await client.post(Uri.parse("$url/user/create_health_info"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "gender": gender,
          "height": height,
          "weight": weight,
          "age": age,
          "blood_type": blood_type,
          "description": description
        }));
    return jsonDecode(response.body);
  }

  static Future login({required String email, required String password}) async {
    var response = await client.post(
      Uri.parse("$url/user/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email":email,
        "password":password
      })
    );
    return response;
  }
}
