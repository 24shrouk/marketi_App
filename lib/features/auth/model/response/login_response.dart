class LogInResponse {
  String? message;
  String? token;

  LogInResponse({this.message, this.token});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }
}
