import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/modules/login/providers/login_success_provider.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/utils/constants.dart';

class LoginController extends GetxController with StateMixin {
  final count = 0.obs;
  final LoginSuccessProvider loginProvider = Get.find();
  final phone = TextEditingController();
  final password = TextEditingController();
  var loading = false.obs;

  void onLogin() async {
    if (loading.isTrue) return;
    loading.value = true;
    await loginProvider
        .postLoginSuccess(phone.text, password.text)
        .then((result) {
      phone.clear();
      password.clear();
      if (result?.data?.isVerified == 0) {
        Get.toNamed(Routes.VERIFYOTP,
            arguments: result?.data?.phoneNumber ?? "");
      }
      Constants.appSettings.token = result?.accessToken ?? '';
      Get.closeAllSnackbars();
      Get.offNamed(Routes.HOME);
    }).catchError((err) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error",
        "Email and Phone Number is in Valid please try again",
      );
    });
    loading.value = false;
  }

  void increment() => count.value++;
}
