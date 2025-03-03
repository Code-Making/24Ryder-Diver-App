import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

class DestinationArrived extends StatefulWidget {
  const DestinationArrived({super.key});

  @override
  State<DestinationArrived> createState() => _DestinationArrivedState();
}

class _DestinationArrivedState extends State<DestinationArrived> {
  void _showFeedbackBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const FeedBackWidget(); // Show feedback form
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader(title: ''),
            80.toh,
            Image.asset(
              'assets/Group 6477.png',
              height: 124,
              width: 124,
            ),
            20.toh,
            "Destination Arrived".toLargeText28,
            10.toh,
            const Text(
              "Ride completed successfully! \nHope you Enjoyed the ride.",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF898989),
              ),
              textAlign: TextAlign.center,
            ),
            20.toh,
            // "\$28".toText(),
            const Text(
              "\$218",
              style: TextStyle(
                fontSize: 34,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            20.toh,
            Image.asset("assets/Line 3.png"),
            20.toh,
            "How is your trip?".toMediumText14,
            16.toh,
            // "".toText(fontSize: 12),
            const Text(
              "Your feedback will help us improve your \ndriving experience better",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFA0A0A0),
              ),
              textAlign: TextAlign.center,
            ),
            30.toh,
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: AppButton(
                label: "Please Feedback",
                onPressed: _showFeedbackBottomSheet, // Open bottom sheet
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedBackWidget extends StatefulWidget {
  const FeedBackWidget({super.key});

  @override
  State<FeedBackWidget> createState() => _FeedBackWidgetState();
}

class _FeedBackWidgetState extends State<FeedBackWidget> {
  double _rating = 0; // Holds the selected rating

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevents taking full height
        children: [
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating; // Update rating state
              });
            },
          ),
          10.toh,
          const Text("Excellent",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          10.toh,
          Text(_rating > 0 ? "You rated $_rating stars" : "Tap to rate",
              style: const TextStyle(fontSize: 14)),
          20.toh,
          // Text(

          //   style: const TextStyle(fontSize: 14),
          // ),
          // 20.toh,
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Write your feedback...",
              border: OutlineInputBorder(),
            ),
          ),
          20.toh,
          AppButton(
            label: 'Submit',
            onPressed: () {
              if (_rating > 0) {
                Navigator.pop(context);
                // Close bottom sheet after submitting
                Get.snackbar(
                    "Thank You!", "Thank you for your $_rating-star rating!");
              } else {
                Get.snackbar("Rate the ride",
                    "Please provide a rating before submitting!");
              }
            },
          ),
        ],
      ),
    );
  }
}
