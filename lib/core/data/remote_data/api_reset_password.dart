import 'dart:convert';
import 'dart:developer';

import 'package:marketi/features/auth/model/request/active_reset_password.dart';
import 'package:marketi/features/auth/model/request/reset_password_request.dart';
import 'package:marketi/features/auth/model/request/send_password_email.dart';
import 'package:marketi/features/auth/model/response/active_reset_password_response.dart';
import 'package:marketi/features/auth/model/response/reset_password_response.dart';
import 'package:marketi/features/auth/model/response/send_password_email.dart';
import 'package:http/http.dart' as http;

class ApiResetPassword {
  // code for reset password
  static Future<SendPasswordEmailResponse> sendPasswordEmail(
    SendPasswordEmailRequest request,
  ) async {
    //  https://marketi-app.onrender.com/api/v1/auth/sendPassEmail

    Uri url = Uri.https(
      'marketi-app.onrender.com',
      '/api/v1/auth/sendPassEmail',
    );
    var response = await http.post(url, body: request.toJson());
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    var responseBody = response.body;
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Success
      var json = jsonDecode(responseBody);
      return SendPasswordEmailResponse.fromJson(json);
    } else {
      // Error from backend
      var json = jsonDecode(responseBody);
      throw Exception(json["message"] ?? "Registration failed");
    }
  }

  static Future<ActiveResetPasswordResponse> activeResetPasswordresponse(
    ActiveResetPasswordRequset request,
  ) async {
    // https://marketi-app.onrender.com/api/v1/auth/activeResetPass

    Uri url = Uri.https(
      'marketi-app.onrender.com',
      '/api/v1/auth/activeResetPass',
    );
    var response = await http.post(url, body: request.toJson());
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    var responseBody = response.body;
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = jsonDecode(responseBody);
      return ActiveResetPasswordResponse.fromJson(json);
    } else {
      var json = jsonDecode(responseBody);
      throw Exception(json["message"] ?? "Registration failed");
    }
  }

  static Future<ResetPasswordResponse> resetPasswordResponse(
    ResetPasswordRequest request,
  ) async {
    // https://marketi-app.onrender.com/api/v1/auth/resetPassword

    Uri url = Uri.https(
      'marketi-app.onrender.com',
      '/api/v1/auth/resetPassword',
    );
    var response = await http.post(url, body: request.toJson());
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    var responseBody = response.body;
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = jsonDecode(responseBody);
      return ResetPasswordResponse.fromJson(json);
    } else {
      var json = jsonDecode(responseBody);
      throw Exception(json["message"] ?? "Registration failed");
    }
  }
}
