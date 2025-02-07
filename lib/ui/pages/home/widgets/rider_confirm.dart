import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/cancel_booking.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

import '../home_screen.dart';

class RiderConfirm extends StatelessWidget {
  const RiderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomSheetWidget(
            height: 432,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Your Ride is arriving in 3 mins",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  40.toh,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
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
                                      color:
                                          "background: #8D8D8D;".toHexColor()),
                                ),
                              ],
                            ),
                            4.toh,
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Volkswagen  - ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey.shade700)),
                                    const TextSpan(
                                      text: "HG5045",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )
                                  ],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                            ),
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
                              const Spacer(),
                              const Text(
                                "Change",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.toh,
                  PaymentMethodWidget(
                    onChanged: (payment) {
                      /// todo notify payment method changed
                    },
                  ),
                  30.toh,
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        child: Column(
                          children: [
                            Text(
                              "\$52",
                              style: TextStyle(
                                color: Palette.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 258,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                "background: #FF0C0C;".toHexColor(),
                            side: BorderSide(
                              color: "background: #FF0C0C;".toHexColor(),
                            ),
                          ),
                          onPressed: () {
                            Get.to(const CancelRide());
                          },
                          child: const Text(
                            "Cancel Ride",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key, required this.onChanged});
  final Function(String payment) onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(const PaymentMethodPage()),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: .4,
              color: "#ECECEC".toHex(),
            ),
            color: "background: #F4F5F6;".toHexColor()),
        child: Row(children: [
          const CashWithCircle(),
          12.toW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cash",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "Change Payment method",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: "background: #868686;".toHexColor()),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          ),
        ]),
      ),
    );
  }
}

class CashWithCircle extends StatelessWidget {
  const CashWithCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: "background: #FFFFFF;".toHexColor(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/filename(1)-2.png',
        ),
      ),
    );
  }
}
