import 'dart:convert';
import 'package:http/http.dart' as http;

class VehicleApiService {
  static const String baseUrl =
      "https://taxi.servermaster.online/taxi_app/api/";

  static Future<List<Map<String, dynamic>>> getMakes() async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}get_makes'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["status"]
            ? List<Map<String, dynamic>>.from(data["data"])
            : [];
      } else {
        throw Exception("Failed to load makes");
      }
    } catch (e) {
      throw Exception("Error fetching makes: $e");
    }
  }

  static Future<List<Map<String, dynamic>>> getModels(String makeId) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}get_model'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"make_id": makeId}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["status"]
            ? List<Map<String, dynamic>>.from(data["data"])
            : [];
      } else {
        throw Exception("Failed to load models");
      }
    } catch (e) {
      throw Exception("Error fetching models: $e");
    }
  }

  static Future<List<Map<String, dynamic>>> getYears(String modelId) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}year'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"model_id": modelId}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["status"]
            ? List<Map<String, dynamic>>.from(data["data"])
            : [];
      } else {
        throw Exception("Failed to load years");
      }
    } catch (e) {
      throw Exception("Error fetching years: $e");
    }
  }
}
