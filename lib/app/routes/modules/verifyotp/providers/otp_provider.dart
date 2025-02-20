import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:rideapp/app/routes/modules/login/login_success_model.dart';
import 'package:rideapp/utils/constants.dart';

class OtpProvider extends GetConnect {
  @override
  void onInit() {
    httpClient
        .addResponseModifier<void>((Request request, Response response) async {
      Future<String?> refreshToken() async {
        // Implement your logic to refresh the token
        // Example: Make an API call to refresh the token
        // Return the new token if successful, otherwise return null
        return null;
      }

      if (response.status == HttpStatus.unauthorized) {
        // Token expired or unauthorized
        final newToken = await refreshToken(); // Implement token refresh logic
        if (newToken != null) {
          // Update token in secure storage or memory
          // Example: await SecureStorage.saveToken(newToken);
          request.headers['Authorization'] = 'Bearer $newToken';
          return await httpClient.request(
              request.method, request.url.path ?? "");
        } else {
          // If unable to refresh token, redirect user to login or handle it accordingly
          // Example: Redirect to login page
          Get.offAllNamed('/login');
        }
      }
      return response;
    });
    httpClient.defaultDecoder = (map) {
      print(map);
      if (map is Map<String, dynamic>) return LoginSuccess.fromJson(map);
      if (map is List) {
        return map.map((item) => LoginSuccess.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.addRequestModifier<void>((request) async {
      request.headers['Authorization'] =
          'Bearer ${Constants.appSettings.token}';
      return request;
    });
  }

  Future<LoginSuccess?> verifyOtp(String phone, String otp) async {
    try {
      var response = await post(
          'verify', {"phone_number": phone, "verification_code": otp});

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
