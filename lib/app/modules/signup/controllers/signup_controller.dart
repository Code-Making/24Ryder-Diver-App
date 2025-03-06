import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rideapp/app/core/utils/sharedprefrences.dart';
import 'package:rideapp/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void onSignUp() async {
    if (_validateInput()) {
      isLoading.value = true;

      try {
        String? deviceToken = await _getDeviceToken();

        final streamedResponse = await postSignup(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          deviceToken: deviceToken,
        );

        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);

          if (jsonResponse['status'] == true) {
            int userId = jsonResponse['data']['id'];
            String? token = jsonResponse['token'];

            // Store User ID, Auth Token, and Device Token
            await SharedPrefs.saveUserId(userId);
            if (token != null) {
              await SharedPrefs.saveToken(token);
            }
            if (deviceToken != null) {
              await SharedPrefs.saveDeviceToken(deviceToken);
            }

            // Retrieve and print stored values
            int? storedUserId = await SharedPrefs.getUserId();
            String? storedDeviceToken = await SharedPrefs.getDeviceToken();

            print("📌 Stored User ID: $storedUserId");
            print("📌 Stored Device Token: $storedDeviceToken");

            Get.snackbar("Success", jsonResponse['message']);
            Get.toNamed(Routes.VERIFYOTP, arguments: userId);
            _clearForm();
          } else {
            Get.snackbar("Invalid Credentials",
                jsonResponse['message'] ?? "Signup Failed");
          }
        } else {
          Get.snackbar("Error", "Something went wrong: ${response.body}");
        }
      } catch (e) {
        Get.snackbar("Error", "An unexpected error occurred");
        print("🚨 Signup Error: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<http.StreamedResponse> postSignup({
    required String name,
    required String email,
    required String phone,
    required String? deviceToken,
  }) {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://taxi.servermaster.online/taxi_app/api/driver-signup'),
    );
    request.body = json.encode({
      "name": name,
      "email": email,
      "mobile": phone,
      "term_services": "1",
      "device_token": deviceToken,
    });
    request.headers.addAll(headers);
    return request.send();
  }

  Future<String?> _getDeviceToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      print("🚨 Error getting device token: $e");
      return null;
    }
  }

  bool _validateInput() {
    if (nameController.text.isEmpty) {
      Get.snackbar("Validation Error", "Name is required");
      return false;
    }
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      Get.snackbar("Validation Error", "Valid email is required");
      return false;
    }
    if (phoneController.text.isEmpty || phoneController.text.length < 10) {
      Get.snackbar("Validation Error", "Valid phone number is required");
      return false;
    }
    return true;
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
  }
}
