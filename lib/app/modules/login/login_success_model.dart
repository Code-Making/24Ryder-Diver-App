class LoginSuccess {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;
  Token? token;

  LoginSuccess(
      {this.status, this.statusCode, this.message, this.data, this.token});

  LoginSuccess.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  User? profile;

  Data({this.user, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    profile =
        json['profile'] != null ? new User.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? mobile;
  Null? emailVerifiedAt;
  Null? password;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? termServices;
  String? otp;
  int? otpVerify;
  String? otpTime;
  String? token;
  Null? deviceToken;
  Null? deviceId;
  int? documentVerified;
  int? vehicleDocVerified;
  int? status;
  int? isDeleted;

  User(
      {this.id,
      this.roleId,
      this.name,
      this.email,
      this.mobile,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.termServices,
      this.otp,
      this.otpVerify,
      this.otpTime,
      this.token,
      this.deviceToken,
      this.deviceId,
      this.documentVerified,
      this.vehicleDocVerified,
      this.status,
      this.isDeleted});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    termServices = json['term_services'];
    otp = json['otp'];
    otpVerify = json['otp_verify'];
    otpTime = json['otp_time'];
    token = json['token'];
    deviceToken = json['device_token'];
    deviceId = json['device_id'];
    documentVerified = json['document_verified'];
    vehicleDocVerified = json['vehicle_doc_verified'];
    status = json['status'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['term_services'] = this.termServices;
    data['otp'] = this.otp;
    data['otp_verify'] = this.otpVerify;
    data['otp_time'] = this.otpTime;
    data['token'] = this.token;
    data['device_token'] = this.deviceToken;
    data['device_id'] = this.deviceId;
    data['document_verified'] = this.documentVerified;
    data['vehicle_doc_verified'] = this.vehicleDocVerified;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}

class Token {
  String? refresh;
  String? access;

  Token({this.refresh, this.access});

  Token.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    return data;
  }
}
