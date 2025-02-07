import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';

import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: 'History',
          addpadding: false,
        ),
        16.toh,
        ...List.generate(5, (i) => const HistoryItem()).toList(),
      ]),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
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
                          const Spacer(),
                          const Text(
                            "7:32 am",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
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
                        "7:32 am",
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
          ).paddingAll(16),
          Divider(
            color: Colors.grey.shade200,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20,
              ),
              12.toW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      "Michel Rached".toText(fontSize: 14),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      8.toW,
                      "4.2".toSmallText12,
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  "Price".toText(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: "background: #656565;".toHexColor(),
                  ),
                  "\$9,00".toText(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )
                ],
              )
            ],
          ).paddingAll(16),
        ],
      ),
    ).marginOnly(bottom: 12);
  }
}
