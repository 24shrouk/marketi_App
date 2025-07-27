class ActiveResetPasswordResponse {
  String? message;

  ActiveResetPasswordResponse({this.message});

  ActiveResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
