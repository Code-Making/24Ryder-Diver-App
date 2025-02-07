import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/app/modules/login/providers/login_success_provider.dart';
import 'package:rideapp/utils/constants.dart';

import '../register_model.dart';

class RegisterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Register.fromJson(map);
      if (map is List) {
        return map.map((item) => Register.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = Constants.baseUrl;
  }

  Future<Register?> getRegister(int id) async {
    final response = await get('register/$id');
    return response.body;
  }

  Future<Register> postRegister(Register register) async {
    try {
      var response = Constants.appEnv == AppEnv.RIDER
          ? await post(
              Constants.appEnv == AppEnv.RIDER ? "driver-register" : 'register',
              register.toJson())
          : await post(
              Constants.appEnv == AppEnv.RIDER ? "driver-register" : 'register',
              register.toJson());
      Get.log(response.request?.url.path ?? '');
      Get.log(response.bodyString ?? '');
      if (response.statusCode == HttpStatus.ok) {
        return response.body;
      } else {
        if (response.body == null) {
          throw AppException(
              message: response.statusText ?? "No internet connection");
        }
        if (response.bodyString != null) {
          throw AppException(
              code: response.statusCode,
              message: jsonDecode(response.bodyString!)['error']);
        }

        throw AppException(
            code: response.statusCode, message: "Connection Timeout");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
