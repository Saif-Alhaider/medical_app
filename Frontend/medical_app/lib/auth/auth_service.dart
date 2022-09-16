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
    if (response.statusCode == 201) {
        var recivedData = jsonDecode(response.body);
        return recivedData;
      } else if (response.statusCode == 401) {
        var recivedData = jsonDecode(response.body);
        return recivedData;
      }
  }
}
