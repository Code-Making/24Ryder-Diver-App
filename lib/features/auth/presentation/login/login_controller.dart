import 'package:get/get.dart';
import 'package:rideapp/features/auth/data/datasource/auth_remote_data_source.dart';

class AuthController extends GetxController {
  final AuthService authService = Get.find();
  login(String email, String password) async {
    await authService.login(password: password, email: email);
  }

  signup(String email, String password) async {
    await authService.register(password: password, email: email);
  }
}
