import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
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
        final streamedResponse = await postSignup(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
        );

        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);

          if (jsonResponse['status'] == true) {
            int userId = jsonResponse['data']['id']; // Extract user ID
            String? token = jsonResponse['token']; // Extract token
            print(jsonResponse['data']);

            // Save user ID and token in SharedPreferences
            await SharedPrefs.saveUserId(userId);
            if (token != null) {
              await SharedPrefs.saveToken(token);
            }

            Get.snackbar("Success", jsonResponse['message']);
            Get.toNamed(Routes.VERIFYOTP, arguments: userId);
            _clearForm();
          } else {
            Get.snackbar("Error", jsonResponse['message'] ?? "Signup Failed");
          }
        } else {
          Get.snackbar("Error",
              "Something went wrong: ${response.body}"); // Fixed error display
        }
      } catch (e) {
        Get.snackbar("Error", "An unexpected error occurred");
        Get.log(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<http.StreamedResponse> postSignup({
    required String name,
    required String email,
    required String phone,
  }) {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('https://taxi.servermaster.online/taxi_app/api/driver-signup'),
    );
    request.body = json.encode(
        {"name": name, "email": email, "mobile": phone, "term_services": "1"});
    request.headers.addAll(headers);
    return request.send();
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
