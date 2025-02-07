import 'package:get/get.dart';
import 'package:rideapp/app/modules/signup/providers/register_provider.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
    Get.lazyPut<RegisterProvider>(
      () => RegisterProvider(),
    );
  }
}
