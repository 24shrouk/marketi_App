class LogInResponse {
  String? message;

  LogInResponse({this.message});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
