import 'dart:convert';
import 'dart:developer';

import 'package:marketi/features/auth/model/request/login_request.dart';
import 'package:marketi/features/auth/model/request/register_request.dart';
import 'package:marketi/features/auth/model/response/login_response.dart';
import 'package:marketi/features/auth/model/response/register_response.dart';
import 'package:http/http.dart' as http;

abstract class ApiAuth {
  static Future<RegisterResponse> register(RegisterRequest request) async {
    // https://marketi-app.onrender.com/api/v1/auth/signUp

    Uri url = Uri.https('marketi-app.onrender.com', '/api/v1/auth/signUp');
    var response = await http.post(url, body: request.toJson());
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');
    var responseBody = response.body;
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Success
      var json = jsonDecode(responseBody);
      return RegisterResponse.fromJson(json);
    } else {
      // Error from backend
      var json = jsonDecode(responseBody);
      throw Exception(json["message"] ?? "Registration failed");
    }
  }

  static Future<LogInResponse> login(LogInRequest request) async {
    // https://marketi-app.onrender.com/api/v1/auth/signIn

    Uri url = Uri.https('marketi-app.onrender.com', '/api/v1/auth/signIn');
    var response = await http.post(url, body: request.toJson());
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return LogInResponse.fromJson(json);
    } else {
      var errorBody = jsonDecode(response.body);
      throw Exception(errorBody['message'] ?? 'Login failed');
    }
  }
}
