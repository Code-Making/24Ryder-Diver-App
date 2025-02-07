import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/app/core/app_settings.dart';
import 'package:rideapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:rideapp/features/auth/presentation/login/login_controller.dart';
import 'package:rideapp/ui/rider/controller/rider_home_controller.dart';

class Constants {
  static String appName = '24 Rider';
  static AppSettings appSettings = Get.find();

  static AppEnv appEnv = AppEnv.RIDEAPP24;
  static String amount = '';
  static String baseUrl = "http://taxiadmin.servermaster.online/api/";
  static String GOOGLE_MAPS_API_KEY = "AIzaSyATN1MJVNxRQWy-H-IPZ5aeVjLS2sRAB6A";
}

Future<void> appInit({required AppEnv appEnv}) async {
  Constants.appEnv = appEnv;
  await GetStorage.init();
  ScreenUtil.ensureScreenSize();
}

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => GetStorage(), fenix: true);
    Get.lazyPut(() => AppSettings(), fenix: true);

    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => RiderHomeController(), fenix: true);
    Get.lazyPut(() => AuthService(), fenix: true);
  }
}
