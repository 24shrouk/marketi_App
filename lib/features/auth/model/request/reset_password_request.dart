class ResetPasswordRequest {
  String? email;
  String? password;
  String? confirmPassword;

  ResetPasswordRequest({this.email, this.password, this.confirmPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
