class ActiveResetPasswordRequset {
  String? email;
  String? code;

  ActiveResetPasswordRequset({this.email, this.code});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['code'] = this.code;
    return data;
  }
}
