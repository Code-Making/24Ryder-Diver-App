import 'package:flutter/material.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

class DestinationArrived extends StatefulWidget {
  const DestinationArrived({super.key});

  @override
  State<DestinationArrived> createState() => _DestinationArrivedState();
}

class _DestinationArrivedState extends State<DestinationArrived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader(
              title: '',
            ),
            80.toh,
            Image.asset('assets/Group 6477.png'),
            20.toh,
            "Destination Arrived".toLargeText28,
            "Ride completed successfully! \nHope you Enjoyed the ride."
                .toLargeText18,
            "\$28".toText(),
            20.toh,
            Image.asset("assets/Line 3.png"),
            20.toh,
            "How is your trip?".toMediumText14,
            16.toh,
            "Youe feedback will help us to improve your \ndriving experience better"
                .toText(
              fontSize: 12,
            ),
            AppButton(
              label: "Please Feedback",
              onPressed: () {},
            )
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.star),
        20.toh,
        const Text("Excelleng"),
        20.toh,
        const Text("You rated Sergio Ramasis 4 star"),
        20.toh,
        const TextField(
          maxLines: 4,
          decoration: InputDecoration(hintText: "Write your text"),
        ),
        20.toh,
        AppButton(
          label: 'Submit',
          onPressed: () {},
        )
      ],
    );
  }
}
