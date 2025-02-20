import 'package:get/get.dart';
import 'package:rideapp/app/routes/modules/verifyotp/providers/otp_provider.dart';

import '../controllers/verifyotp_controller.dart';

class VerifyotpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyotpController>(
      () => VerifyotpController(),
    );
    Get.lazyPut<OtpProvider>(() => OtpProvider());
  }
}
