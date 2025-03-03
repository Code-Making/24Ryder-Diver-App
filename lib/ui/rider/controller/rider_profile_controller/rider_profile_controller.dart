import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:rideapp/app/core/utils/sharedprefrences.dart';

class RiderProfileController extends GetxController {
  var isLoading = false.obs;
  var name = "".obs;
  var email = "".obs;
  var mobile = "".obs;
  var gender = "".obs;
  var address = "".obs;
  var profileImage = "".obs;
  var userId = "".obs;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    isLoading.value = true;

    int? storedUserId = await SharedPrefs.getUserId();
    print("📌 Stored User ID: $storedUserId"); // Debugging

    if (storedUserId == null) {
      Get.snackbar("Error", "User ID not found!");
      isLoading.value = false;
      return;
    }

    userId.value = storedUserId.toString();

    try {
      var response = await http.post(
        Uri.parse(
            "https://taxi.servermaster.online/taxi_app/api/get_driver_detail"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"driver_id": userId.value}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == true) {
          var userData = data['data'];
          name.value = userData['name'] ?? "";
          email.value = userData['email'] ?? "";
          mobile.value = userData['mobile'] ?? "";
          gender.value = userData['gender'] ?? "Not Provided";
          address.value = userData['address'] ?? "Not Provided";
          profileImage.value = userData['profile_image'] != null &&
                  userData['profile_image'].isNotEmpty
              ? "https://taxi.servermaster.online/${userData['profile_image']}"
              : "";
        }
      } else {
        Get.snackbar("Error", "Failed to load profile details.");
      }
    } catch (e) {
      print("🚨 Error fetching user details: $e");
      Get.snackbar("Error", "Something went wrong.");
    }
    isLoading.value = false;
  }
}
