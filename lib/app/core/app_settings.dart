import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rideapp/app/routes/app_pages.dart';

class AppSettings {
  final GetStorage _getStorage = Get.find();
  String get token => _getStorage.read('token') ?? '';
  set token(String tkn) => _getStorage.write('token', tkn);

  void logout() {
    token = '';
    Get.offNamed(Routes.LOGIN);
  }
}
