import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rideapp/app/core/utils/sharedprefrences.dart';

class VerifyotpController extends GetxController {
  // final TextEditingController otp = TextEditingController();
  final TextEditingController otp = TextEditingController(text: "123456");
  final isLoading = false.obs;

  Future<bool> onVerify() async {
    if (isLoading.value) return false;
    isLoading.value = true;

    try {
      int? userId = Get.arguments ?? await SharedPrefs.getUserId();
      if (userId == null) {
        Get.snackbar("Error", "User ID is missing");
        return false;
      }

      final response = await postVerifyOtp(userId: userId, otp: otp.text);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(await response.stream.bytesToString());

        if (jsonResponse['status'] == true) {
          Get.snackbar(
              "Success", jsonResponse['msg'] ?? "OTP Verified Successfully");
          return true; // Verification successful
        } else {
          Get.snackbar(
              "Error", jsonResponse['msg'] ?? "OTP verification failed");
          return false;
        }
      } else {
        Get.snackbar("Error", "Failed to verify OTP. Please try again.");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred: ${e.toString()}");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<http.StreamedResponse> postVerifyOtp({
    required int userId,
    required String otp,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse(
          'https://taxi.servermaster.online/taxi_app/api/driver_verify_otp'),
    );
    request.body = json.encode({"user_id": userId.toString(), "otp": otp});
    request.headers.addAll(headers);
    return request.send();
  }
}
