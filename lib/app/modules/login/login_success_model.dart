class LoginSuccess {
  String? accessToken;
  String? tokenType;
  Data? data;

  LoginSuccess({this.accessToken, this.tokenType, this.data});

  LoginSuccess.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['data'] = data;
      return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? isAdmin;
  String? phoneNumber;
  int? isVerified;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.isAdmin,
      this.phoneNumber,
      this.isVerified,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    phoneNumber = json['phone_number'];
    isVerified = json['isVerified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_admin'] = isAdmin;
    data['phone_number'] = phoneNumber;
    data['isVerified'] = isVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
