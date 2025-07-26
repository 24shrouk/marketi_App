class RegisterRequest {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;

  RegisterRequest({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
