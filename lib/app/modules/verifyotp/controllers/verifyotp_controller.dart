import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/app/modules/verifyotp/providers/otp_provider.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/utils/constants.dart';

class VerifyotpController extends GetxController {
  //TODO: Implement VerifyotpController
  final OtpProvider otpProvider = Get.find();
  var loading = false.obs;
  final TextEditingController otp = TextEditingController();

  void onVerify() async {
    if (loading.isTrue) return;
    loading.value = true;
    await otpProvider
        .verifyOtp(Get.arguments.toString(), otp.text)
        .then((result) {
      if (result?.data?.isVerified == 0) {
        Get.to(
            () => AppEnv.RIDER == Constants.appEnv ? Routes.HOME : Routes.HOME);
        // Get.toNamed(Routes.HOME);
      }
    }).catchError((err) {
      Get.closeAllSnackbars();
      Get.snackbar(
        "Error",
        "OTP is not valid ! Please Try again",
      );
    });
    loading.value = false;
  }
}
