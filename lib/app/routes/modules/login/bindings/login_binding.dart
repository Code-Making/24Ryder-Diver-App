import 'package:get/get.dart';
import 'package:rideapp/app/routes/modules/login/providers/login_success_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<LoginSuccessProvider>(
      () => LoginSuccessProvider(),
    );
  }
}
