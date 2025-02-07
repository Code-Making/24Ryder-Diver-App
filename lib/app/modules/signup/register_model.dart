class Register {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? passwordConfirmation;

  Register(
      {this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.passwordConfirmation});

  Register.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
    Map<String, dynamic> toJsonDriver() {
    final data = <String, dynamic>{};
    data['driv_name'] = name;
    data['driv_email'] = email;
    data['phone_number'] = phoneNumber;
    data['driv_pass'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
