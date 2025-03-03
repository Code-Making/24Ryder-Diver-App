import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/chat/chat.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(
        isScrollView: false,
        children: [
          const CustomHeader(
            title: 'Help',
            addpadding: false,
          ),
          20.toh,
          Expanded(
              child: ListView(
            reverse: true,
            children: [
              const RiderMessage(
                message: "Welcome to 24RYDE Customer\nService ",
                // showTime: false,
              ).marginOnly(
                bottom: 20,
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: SizedBox(
          height: 44,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: [
                // Container(
                //     height: 60,
                //     padding: EdgeInsets.symmetric(horizontal: 16),
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //           color: "border: 1px solid #302D81".toHexColor(),
                //         ),
                //         borderRadius: BorderRadius.circular(30)),
                //     child: ("Issue with ride").toText(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600,
                //       color: "border: 1px solid #302D81".toHexColor(),
                //     )).margin20right,
                ...List.generate(
                  4,
                  (i) => Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: "border: 1px solid #302D81".toHexColor(),
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child:
                          (i == 0 ? "Issue with ride" : "Lorem Ipsum").toText(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: "border: 1px solid #302D81".toHexColor(),
                      )).margin12right,
                ),
              ])).marginOnly(bottom: 90).margin20right,
    );
  }
}
