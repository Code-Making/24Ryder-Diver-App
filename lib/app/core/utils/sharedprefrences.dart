import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId);
    print("✅ User ID Saved: $userId"); // Debugging
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('user_id');
    print("📌 Retrieved User ID: $userId"); // Debugging
    return userId;
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    print("✅ Auth Token Saved: $token"); // Debugging
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    print("📌 Retrieved Auth Token: $token"); // Debugging
    return token;
  }

  static Future<void> saveDeviceToken(String deviceToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('device_token', deviceToken);
    print("✅ Device Token Saved: $deviceToken"); // Debugging
  }

  static Future<String?> getDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? deviceToken = prefs.getString('device_token');
    print("📌 Retrieved Device Token: $deviceToken"); // Debugging
    return deviceToken;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("🗑️ SharedPreferences Cleared!");
  }
}
