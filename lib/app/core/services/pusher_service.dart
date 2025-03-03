import 'dart:convert';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:rideapp/app/core/utils/sharedprefrences.dart';

class PusherService {
  late PusherChannelsFlutter pusher;
  Function(Map<String, dynamic>)? onNewRideRequest;

  Future<void> initPusher() async {
    pusher = PusherChannelsFlutter.getInstance();

    try {
      // Retrieve the user ID from shared preferences
      int? userId = await SharedPrefs.getUserId();

      if (userId == null) {
        print("❌ User ID not found. Cannot initialize Pusher.");
        return;
      }

      await pusher.init(
        apiKey: "be9fe222aee4c6d45ad6",
        cluster: "ap2",
        authEndpoint: null,
      );
      await pusher.connect();
      print("✅ Pusher Connected");

      // Subscribe to driver channel
      await subscribeToChannel(userId);
    } catch (e) {
      print("❌ Pusher initialization error: $e");
    }
  }

  Future<void> subscribeToChannel(int userId) async {
    String channelName = "driver-channel.$userId";
    try {
      await pusher.subscribe(
        channelName: channelName,
        onEvent: (event) {
          print("📡 Received event: ${event.eventName}");
          print("📊 Raw Event Data: ${event.data}");

          try {
            // ✅ Ignore empty system events
            if (event.data is Map<Object?, Object?>) {
              Map<String, dynamic> eventData =
                  Map<String, dynamic>.from(event.data);
              if (eventData.isEmpty) {
                print("⚠️ Ignoring empty event data.");
                return;
              }

              print("✅ Parsed Event Data: $eventData");

              if (event.eventName == "new-booking") {
                print("🚖 New Booking Request: $eventData");
                onNewRideRequest?.call(eventData);
              }
            }
          } catch (e) {
            print("⚠️ Error parsing event data: $e");
          }
        },
      );

      print("✅ Subscribed to channel: $channelName");
    } catch (e) {
      print("❌ Subscription error: $e");
    }
  }
}
