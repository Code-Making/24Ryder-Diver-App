import 'package:get/get.dart';

class AuthService extends GetConnect {
  @override
  void onInit() {
    baseUrl = "http://taxiadmin.servermaster.online/api/";
    super.onInit();
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    await post<dynamic>("login", {"email": email, "password": password});
  }

  Future<dynamic> register(
      {required String password, required String email}) async {
    await post<dynamic>("register", {
      "name": "Aashish Bhai",
      "email": "tm.aashish1@example.com",
      "phone_number": "+9779848077880",
      "password": "password123",
      "password_confirmation": "password123"
    });
  }

  Future<dynamic> verifyOtp() async {
    await post<dynamic>("verify",
        {"phone_number": "+9779848077880", "verification_code": "116206"});
  }
}
