import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rideapp/app/core/utils/sharedprefrences.dart';
import 'package:rideapp/ui/pages/otp/otp.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final usernameController = TextEditingController();

  void onLogin() async {
    if (_validateInput()) {
      isLoading.value = true;

      try {
        // Retrieve the stored device token
        String? deviceToken = await SharedPrefs.getDeviceToken();

        if (deviceToken == null) {
          print("🚨 ERROR: Device token is missing");
          Get.snackbar("Error", "Device token not found");
          return;
        }

        final streamedResponse = await postSignin(
          username: usernameController.text,
          deviceToken: deviceToken,
        );

        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);
          print("📩 Login API Response: $jsonResponse"); // Debugging

          if (jsonResponse['status'] == true) {
            // Extract user_id and access token
            int? userId = jsonResponse['data']['user']['id'];
            String? accessToken = jsonResponse['token']['access'];

            if (userId != null && accessToken != null) {
              await SharedPrefs.saveUserId(userId);
              await SharedPrefs.saveToken(accessToken);
              print("✅ Stored User ID: $userId");
              print("✅ Stored Token: $accessToken");
              print("✅ Stored Device Token: $deviceToken");

              Get.snackbar("Success", jsonResponse['message']);
              Get.to(() => const Otp(), arguments: userId);
              _clearForm();
            } else {
              print("🚨 ERROR: Missing user_id or token in API response");
              Get.snackbar("Login Error", "Invalid response data");
            }
          } else {
            Get.snackbar("Login Error",
                jsonResponse['message'] ?? "Invalid login attempt");
          }
        } else {
          Get.snackbar("Invalid Credentials", "Please Try Again");
        }
      } catch (e) {
        Get.snackbar(
            "Error", "An unexpected error occurred. Please try again later.");
        print("🚨 Login Error: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<http.StreamedResponse> postSignin(
      {required String username, required String deviceToken}) {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://taxi.servermaster.online/taxi_app/api/driver_login'),
    );
    request.body = json.encode({
      "username": username,
      "device_token": deviceToken, // Added device token
    });
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
