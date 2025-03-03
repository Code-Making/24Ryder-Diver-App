import 'package:get/get.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/utils/constants.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        1.seconds,
        () => Constants.appSettings.token.isNotEmpty
            ? Get.toNamed(Routes.HOME)
            : Get.offNamed(Routes.LOGIN));
  }

  void increment() => count.value++;
}
