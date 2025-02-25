import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  final PusherChannelsFlutter pusher = PusherChannelsFlutter();

  Future<void> initPusher({
    required Function(Map<String, dynamic>) onEvent,
  }) async {
    try {
      await pusher.init(
        apiKey: "be9fe222aee4c6d45ad6",
        // be9fe222aee4c6d45ad6
        cluster: "ap2",
        onEvent: (event) {
          if (event.eventName == "new-ride-request") {
            final data = Map<String, dynamic>.from(event.data);
            onEvent(data); // Send data to UI
          }
        },
      );

      await pusher.subscribe(channelName: "ride-requests");
      await pusher.connect();
    } catch (e) {
      print("Pusher error: $e");
    }
  }

  void disconnectPusher() {
    pusher.unsubscribe(channelName: "ride-requests");
    pusher.disconnect();
  }
}
