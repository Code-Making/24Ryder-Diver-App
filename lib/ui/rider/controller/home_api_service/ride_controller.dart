import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookingController extends GetxController {
  final String apiUrl =
      "https://taxi.servermaster.online/taxi_app/api/booking_list";

  var bookingList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;

  Future<void> fetchBookingList(int driverId) async {
    isLoading.value = true;
    errorMessage.value = "";

    try {
      var headers = {'Content-Type': 'application/json'};
      var body = json.encode({"driver_id": "8"});

      var response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse["status"] == true) {
          bookingList.value =
              List<Map<String, dynamic>>.from(jsonResponse["data"]);
        } else {
          errorMessage.value = jsonResponse['msg'];
        }
      } else {
        errorMessage.value = "Server error: ${response.reasonPhrase}";
      }
    } catch (e) {
      errorMessage.value = "Error fetching bookings: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
