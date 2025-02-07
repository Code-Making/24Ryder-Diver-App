import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/history/history.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({super.key});

  @override
  State<MyEarnings> createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  var selected = 'Upcoming';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: 'My Earnings',
          addpadding: false,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 101,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "\$320".toText(fontSize: 24, fontWeight: FontWeight.w600),
                    8.toh,
                    "Overall earning".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: "#7E7E7E".toHex()),
                  ],
                ),
              ).marginSymmetric(vertical: 16),
            ),
            20.toW,
            Expanded(
              child: Container(
                height: 101,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "2".toText(fontSize: 24, fontWeight: FontWeight.w600),
                    8.toh,
                    "Today Booking".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: "#7E7E7E".toHex()),
                  ],
                ),
              ).marginSymmetric(vertical: 16),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 101,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "\$320".toText(fontSize: 24, fontWeight: FontWeight.w600),
                    8.toh,
                    "Today's earning".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: "#7E7E7E".toHex()),
                  ],
                ),
              ).marginSymmetric(vertical: 16),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Palette.primary),
              borderRadius: BorderRadius.circular(8)),
          height: 48,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: selected == "Upcoming" ? Palette.primary : null,
                    borderRadius: BorderRadius.circular(4)),
                child: "Upcoming"
                    .toText(fontSize: 12, color: Colors.white)
                    .paddingAll(16),
              ).expanded,
              Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: selected == "Completed" ? Palette.primary : null,
                    borderRadius: BorderRadius.circular(4)),
                child: "Completed"
                    .toText(
                      fontSize: 12,
                      color:
                          selected == "Completed" ? Colors.white : Colors.grey,
                    )
                    .paddingAll(16),
              ).expanded,
              Container(
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: selected == "Completed" ? Palette.primary : null,
                    borderRadius: BorderRadius.circular(4)),
                child: "Cancelled"
                    .toText(
                      fontSize: 12,
                      color:
                          selected == "Cancelled" ? Colors.white : Colors.grey,
                    )
                    .paddingAll(16),
              ).expanded,
            ],
          ),
        ).marginSymmetric(horizontal: 0).marginOnly(bottom: 20, top: 20),
        "Today's rides".title.marginOnly(
              bottom: 12,
            ),
        ...List.generate(5, (i) => const HistoryItem()).toList(),
      ]),
    );
  }
}
