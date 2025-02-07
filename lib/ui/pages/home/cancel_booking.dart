import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/search_dorp_screen.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

import 'home_screen.dart';

const titleStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

class CancelRide extends StatelessWidget {
  const CancelRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularCloseButton(),
                    Center(
                      child: Text("Cancel Ride",
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              100.toh,
              SizedBox(
                height: 182,
                child: Stack(children: [
                  CircleAvatar(
                    radius: 70,
                    child: Image.asset(
                      'assets/Ellipse 10.png',
                      height: 182,
                      width: 187,
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheetWidget(
        height: 392,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Why do you want to cancel?",
                style: titleStyle,
              ),
              20.toh,
              ...[
                "I don’t need this journey.",
                'I want to change the details of the journey.',
                '''The driver took too long to be appointed.''',
                'Other'
              ].map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          e == 'I want to change the details of the journey.'
                              ? "assets/Ellipse 11.png"
                              : "assets/Ellipse 5.png",
                          width: 24,
                        ),
                        12.toW,
                        Text(
                          e,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: "background: #656565;".toHexColor()),
                        ),
                      ],
                    ),
                  )),
              20.toh,
              AppButton(
                isRounded: true,
                label: 'Cancel Ride',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
