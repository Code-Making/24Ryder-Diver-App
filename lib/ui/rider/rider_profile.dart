import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/rider/document_upload.dart';

class RiderProfile extends StatelessWidget {
  const RiderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Base(children: [
        const CustomHeader(
          title: 'Edit Profile',
          addpadding: false,
        ),
        Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/rider/Group 11305.png',
                height: 87,
                width: 83,
              ),
              8.toW,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Frank Smith"
                      .toText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )
                      .marginOnly(bottom: 8),
                  "frank.smith@gmail.com"
                      .toText(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: "#7E7E7E".toHex())
                      .marginOnly(bottom: 8),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.phone,
                        color: Palette.primary,
                        size: 16,
                      ),
                      "+1 1234567890".toMediumText14
                    ],
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 31,
                width: 31,
                decoration: BoxDecoration(
                    border: Border.all(color: Palette.primary),
                    borderRadius: BorderRadius.circular(50)),
                child: Image.asset(
                  "assets/Group 11210.png",
                  height: 14,
                ).paddingAll(8),
              ),
            ],
          ).paddingAll(8).paddingSymmetric(vertical: 8),
        ),
        "Documents"
            .toText(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: "#212121".toHex())
            .padding20top,
        Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade100, offset: const Offset(1, 1))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Driving License"
                          .toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                          .marginOnly(bottom: 4),
                      "A Driving license is an official document".toText(
                          color: "#717171".toHex(),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(
                      CupertinoIcons.delete,
                      size: 16,
                    ),
                  ),
                ]),
                Image.asset(
                  "assets/Group 11482.png",
                  height: 214,
                  width: double.infinity,
                ).marginOnly(top: 12)
              ],
            )).marginOnly(bottom: 20),
        const UploadDocumentWidget(
          isSelected: true,
          title: "Vehicle Registration",
          subtitle: "Ghana official document",
        ),
        const UploadDocumentWidget(
          isSelected: true,
          title: "Insurance Document",
          subtitle: "Voter id card is an official document",
        ),
      ]),
    );
  }
}
