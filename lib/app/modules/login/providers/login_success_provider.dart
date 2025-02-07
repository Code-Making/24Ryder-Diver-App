import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/app/modules/login/login_success_model.dart';
import 'package:rideapp/utils/constants.dart';

class LoginSuccessProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      print(map);
      if (map is Map<String, dynamic>) return LoginSuccess.fromJson(map);
      if (map is List) {
        return map.map((item) => LoginSuccess.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = Constants.baseUrl;
  }

  Future<LoginSuccess?> getLoginSuccess(int id) async {
    final response = await get('loginsuccess/$id');

    return response.body;
  }

  Future<LoginSuccess?> postLoginSuccess(String phone, String password) async {
    try {
      var response = await post(
          Constants.appEnv == AppEnv.RIDER ? 'login' : 'login',
          {"email": phone, "password": password});

      if (response.statusCode == HttpStatus.ok) {
        return response.body;
      } else {
        // parseResponse(response);
        if (response.body == null) {
          throw AppException(
              message: response.bodyString ?? "No internet connection");
        }
        throw AppException(
            code: response.statusCode, message: "Connection Timeout");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> deleteLoginSuccess(int id) async =>
      await delete('loginsuccess/$id');
}

parseResponse(res) {
  switch (res.statusCode) {
    case 400:
      throw AppException(
          code: res.statusCode,
          message: res.body?['message'] ??
              "Something went wrong. Please try again later.",
          details: res.bodyString);
    case 500:
      throw AppException(
          code: res.statusCode,
          message: "Something went wrong. Please try again later.",
          details: res.bodyString);
    default:
      throw AppException(
          code: res.statusCode,
          message: res.body?['message'] ??
              "Something went wrong. Please try again later.",
          details: res.bodyString);
  }
}

Future<T> parseRes<T>(Response res,
    {required T Function(String) convertResponseToModel}) async {
  if (kDebugMode) {
    Get.log(res.request!.url.toString());
    Get.log(res.statusCode.toString());
    Get.log(jsonEncode(res.body).toString());
  }
  switch (res.statusCode) {
    case 200:
    case 201:
      return convertResponseToModel(jsonEncode(res.body));
    // return BaseResponse(
    //     body: res.body,
    //     message: res.body['message'].toString(),
    //     statusCode: res.statusCode!);
    case 401:
      // appSettings.logout();
      // Get.toNamed(Routes.WELCOME);
      break;
    case 400:
      throw AppException(
          code: res.statusCode,
          message: res.body?['message'] ??
              "Something went wrong. Please try again later.",
          details: res.bodyString);
    case 500:
      throw AppException(
          code: res.statusCode,
          message: "Something went wrong. Please try again later.",
          details: res.bodyString);
    default:
      throw AppException(
          code: res.statusCode,
          message: res.body?['message'] ??
              "Something went wrong. Please try again later.",
          details: res.bodyString);
  }
  throw AppException(
      code: res.statusCode,
      message: "Something went wrong. Please try again later.",
      details: res.bodyString);

  // log(res.statusCode.toString());
  // switch (res.statusCode) {
  //   case 200:
  //   case 201:
  //     if (res.body != null) {
  //       return BaseResponse(
  //           body: res.body,
  //           message: res.body['message'].toString(),
  //           statusCode: res.statusCode!);
  //     } else {
  //       throw FetchDataException(
  //           'Check your network connection and try again.');
  //     }
  //   case 400:
  //   case 422:
  //     throw BadRequestException(res.body['message'].toString());
  //   case 401:
  //   case 403:
  //     throw UnauthorisedException(res.body);

  //   case 404:
  //     throw BadRequestException(
  //         'Opps, Something Went Wrong please try in a while.',
  //         message: res.body['message'].toString());
  //   case 500:
  //     throw BadRequestException(
  //         'Opps, Something Went Wrong please try in a while.',
  //         message: res.body.toString());
  //   default:
  //     throw FetchDataException('Check your network connection and try again.');
  // }
}

class AppException implements Exception {
  final int? code;
  final String? message;
  final dynamic details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "$message";
  }
}
