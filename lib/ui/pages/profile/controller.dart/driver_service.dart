import 'dart:convert';
import 'package:http/http.dart' as http;

class DriverService {
  static const String _baseUrl =
      'https://taxi.servermaster.online/taxi_app/api/get_driver_detail';

  static Future<Map<String, dynamic>?> fetchDriverDetails(
      String driverId) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: json.encode({"driver_id": driverId}),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status']) {
          return data['data'];
        }
      }
    } catch (e) {
      print('Error fetching driver details: $e');
    }
    return null;
  }
}
