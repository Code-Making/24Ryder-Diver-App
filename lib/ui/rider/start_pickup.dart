import 'package:flutter/material.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

class StartPickup extends StatefulWidget {
  const StartPickup({super.key});

  @override
  State<StartPickup> createState() => _StartPickupState();
}

class _StartPickupState extends State<StartPickup> {
  bool endPickup = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/Mask group.png'),
              ),
              8.toW,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Alex Robin",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        20.toW,
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        4.toW,
                        Text(
                          "4",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: "background: #8D8D8D;".toHexColor()),
                        ),
                      ],
                    ),
                    4.toh,
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 14,
                          color: Palette.primary,
                        ),
                        4.toW,
                        "15 Min".toText(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: "#717171".toHex()),
                      ],
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Palette.primary,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/index.png'),
                ),
              ),
              12.toW,
              CircleAvatar(
                radius: 24,
                backgroundColor: Palette.primary,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/index-2.png'),
                ),
              ),
            ],
          ),
          30.toh,
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.radio_button_checked,
                          color: Colors.green,
                          size: 24,
                        ),
                        8.toW,
                        const Text(
                          "Neemuch RD. Gopalbari, Bari Sad",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/Line 2.png",
                        // height: 8,
                        width: 2,
                      ),
                    ),
                    Row(children: [
                      Image.asset(
                        'assets/ic_Pin-2.png',
                        width: 24,
                      ),
                      8.toW,
                      const Text(
                        "Jawahar Lal Nehru Marg, D-Block",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ])
                  ],
                ),
              ),
            ],
          ),
          20.toh,
          AppButton(
            label: endPickup ? "End Pickup" : 'Start Pickup',
            isRounded: true,
            onPressed: () {
              setState(() {
                endPickup = true;
              });
            },
          ),
          20.toh,
        ],
      ),
    );
  }
}
