import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

class SelectUploadOption extends StatelessWidget {
  const SelectUploadOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              "Select upload option".toText(
                fontSize: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.back(result: true);
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/rider/Group.png",
                      height: 18,
                      width: 18,
                    ).paddingOnly(right: 12),
                    "Take a photo".toLargeText16400,
                  ],
                ).marginOnly(top: 30).paddingAll(4),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              GestureDetector(
                onTap: () => Get.back(result: true),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/rider/filename (4) 1.png",
                      height: 18,
                      width: 18,
                    ).paddingOnly(right: 12),
                    "Choose from gallery".toLargeText16400,
                  ],
                ).paddingAll(4),
              )
            ],
          ),
        ),
        AppButton(
            isRounded: true,
            textColor: Colors.red,
            color: Colors.white,
            label: 'Cancel',
            onPressed: () {
              Get.back();
            }).paddingOnly(
          top: 12,
        ),
      ],
    ).marginAll(30);
  }
}
