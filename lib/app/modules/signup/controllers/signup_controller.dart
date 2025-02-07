import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/modules/signup/providers/register_provider.dart';
import 'package:rideapp/app/modules/signup/register_model.dart';
import 'package:rideapp/app/routes/app_pages.dart';

class SignupController extends GetxController with StateMixin {
  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  //TODO: Implement SignupController
  final signupProvider = Get.find<RegisterProvider>();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final count = 0.obs;

  void increment() => count.value++;

  void onSignUp() async {
    try {
      var signupres = await signupProvider
          .postRegister(Register(
              name: name.text,
              phoneNumber: phone.text,
              email: email.text,
              password: password.text,
              passwordConfirmation: password.text))
          .then((register) {
        phone.clear();
        email.clear();
        name.clear();
        password.clear();
        Get.toNamed(Routes.VERIFYOTP, arguments: phone.text);
      }).catchError((err) {
        Get.closeAllSnackbars();
        Get.snackbar(
          "Error",
          "Signup Error",
        );
      });

      print(signupres);
    } catch (e) {
      Get.log(e.toString());
    }
  }
}
