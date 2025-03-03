import 'dart:convert';
import 'package:get/get.dart';

class ChatService extends GetConnect {
  Future<bool> sendMessage(String message) async {
    final response = await post(
      'https://taxi.servermaster.online/taxi_app/api/send-message',
      jsonEncode({"message": message, "user_id": "8", "sender_id": "40"}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 && response.body['status'] == true) {
      return true;
    } else {
      Get.snackbar("Error", "Failed to send message");
      return false;
    }
  }
}
