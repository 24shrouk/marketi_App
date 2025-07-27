class SendPasswordEmailResponse {
  String? message;

  SendPasswordEmailResponse({this.message});

  SendPasswordEmailResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
