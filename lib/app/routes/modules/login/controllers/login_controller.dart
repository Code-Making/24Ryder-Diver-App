import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rideapp/app/core/utils/sharedprefrences.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/ui/pages/otp/otp.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final usernameController = TextEditingController();

  void onLogin() async {
    if (_validateInput()) {
      isLoading.value = true;

      try {
        final response = await postSignin(username: usernameController.text);

        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final jsonResponse = jsonDecode(responseBody);

          if (jsonResponse['status'] == true) {
            // Extract user_id and token
            final int? userId = jsonResponse['data']['user_id'];
            final String? token = jsonResponse['data']['auth_token'];

            if (userId != null && token != null) {
              // Store in SharedPreferences
              await SharedPrefs.saveUserId(userId);
              await SharedPrefs.saveToken(token);
            }

            Get.snackbar("Success", jsonResponse['message']);
            // Get.toNamed(Routes.VERIFYOTP, arguments: userId);
            Get.to(() => const Otp());
            _clearForm();
          } else {
            Get.snackbar("Login Error",
                jsonResponse['message'] ?? "Invalid login attempt");
          }
        } else {
          Get.snackbar("Error", "Server Error: ${response.reasonPhrase}");
        }
      } catch (e) {
        Get.snackbar(
            "Error", "An unexpected error occurred. Please try again later.");
        Get.log("Login Error: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<http.StreamedResponse> postSignin({required String username}) {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://taxi.servermaster.online/taxi_app/api/driver_login'),
    );
    request.body = json.encode({"username": username});
    request.headers.addAll(headers);
    return request.send();
  }

  bool _validateInput() {
    if (usernameController.text.isEmpty) {
      Get.snackbar("Validation Error", "Email or Phone is required");
      return false;
    }
    return true;
  }

  void _clearForm() {
    usernameController.clear();
  }
}
