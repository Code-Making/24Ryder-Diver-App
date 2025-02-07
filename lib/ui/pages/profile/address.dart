import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/home_screen.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Make the overall background white.
      backgroundColor: Colors.white,
      body: Base(
        children: [
          const CustomHeader(
            title: 'Address',
            addpadding: false,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: 4,
            itemBuilder: (_, i) => Card(
              // Set the card color to white with opacity.
              color: Colors.white.withOpacity(0.8),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Image.asset(
                  "assets/icons/Map.png",
                  height: 24,
                  // You can add color if needed:
                  // color: Theme.of(context).primaryColor,
                ),
                title: "Office".toText(),
                subtitle: "2972 Westheimer Rd. Santa Ana, Illinois 85486"
                    .toText(color: "#B8B8B8".toHex(), fontSize: 12),
                trailing: Image.asset(
                  'assets/Pencil.png',
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: AppButton(
        label: 'Add New Address',
        onPressed: () {
          Get.bottomSheet(
            BottomSheetWidget(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 34,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 134,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topRight,
                            child: CloseButton(),
                          ),
                        ],
                      ),
                    ),
                    "Address Details".toText(fontSize: 20).padding20top,
                    const Divider().padding20top,
                    const CustomInputField(
                      hintText: "Name of Address",
                    ).padding20top,
                    const CustomInputField(
                      hintText: "Address Details",
                      maxLines: 4,
                    ).padding20top,
                    AppButton(
                      label: 'Add Address',
                      onPressed: () {},
                    ).padding20top,
                  ],
                ).paddingAll(8),
              ),
            ),
          );
        },
      ).paddingOnly(bottom: 20, left: 16, right: 16),
    );
  }
}
