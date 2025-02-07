import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/home_screen.dart';
import 'package:rideapp/ui/pages/home/payments/payment_method.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

class ApplyCoupon extends StatelessWidget {
  const ApplyCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomHeader(title: 'Apply Coupon'),
              20.toh,
              ...[
                {
                  "label": "Discount 15% off",
                  "subtitle": "Special Promo valid for Black Friday",
                  "image": "assets/shopping-bag-discount-svgrepo-com 1-2.png",
                },
                {
                  "label": "Special 5% off",
                  "subtitle": "Special Promo valid for Black Friday",
                  "image": "assets/shopping-bag-discount-svgrepo-com 1.png"
                },
                {
                  "label": "Cashback 15% off",
                  "subtitle": "Special Promo valid for Black Friday",
                  "image": "assets/shopping-bag-discount-svgrepo-com 1-4.png"
                },
                {
                  "label": "Discount 15% off",
                  "subtitle": "Special Promo valid for Black Friday",
                  "image": "assets/shopping-bag-discount-svgrepo-com 1-2.png",
                },
                {
                  "label": "Special 5% off",
                  "subtitle": "Special Promo valid for Black Friday",
                  "image": "assets/shopping-bag-discount-svgrepo-com 1.png"
                },
                {
                  "label": "Cashback 15% off",
                  "subtitle": "Special Promo valid for Black Friday",
                  "image": "assets/shopping-bag-discount-svgrepo-com 1-4.png"
                },
              ].map(
                (e) => DiscountOffer(
                  onTap: () {
                    Get.bottomSheet(
                        BottomSheetWidget(
                          // height: 650,
                          child: const DiscountSheet().paddingAll(20),
                        ),
                        isScrollControlled: true);
                  },
                  data: e,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountSheet extends StatelessWidget {
  const DiscountSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 650,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
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
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                const Align(
                    alignment: Alignment.topRight, child: CloseButton()),
              ],
            ),
          ),
          20.toh,
          "Special Offer"
              .toText(fontSize: 20, fontWeight: FontWeight.w500)
              .center,
          const Divider(),
          20.toh,
          Center(
            child: Image.asset(
              "assets/tag-discount-svgrepo-com 1.png",
              height: 100,
              width: 100,
            ),
          ),
          "Discount 15% off".toLargeText28.center,
          "Special Promo valid for Black Friday".toSmallText12.center,
          20.toh,
          Container(
            width: 130,
            height: 39,
            padding: const EdgeInsets.only(left: 20, right: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/Frame 39339.png"),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(10),
              // gradient: LinearGradient(colors: [
              //   Palette.primary,
              //   Color.fromRGBO(48, 45, 129, 0.64),
              //   Color.fromRGBO(48, 45, 129, 0.064),
              //   // Color.fromRGBO(48, 45, 129, 0.054),
              // ]),
            ),
          ).center,
          20.toh,
          Image.asset("assets/Line 3.png"),
          20.toh,
          "Terms and Conditions".toText(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: "#414141".toHex()),
          10.toh,
          ...List.generate(
            3,
            (i) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                  child: Icon(
                    Icons.circle,
                    size: 6,
                    color: Colors.grey,
                  ),
                ),
                8.toW,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                    .toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)
                    .expanded,
              ],
            ),
          ),
          20.toh,
          AppButton(
            label: "Use Promo",
            onPressed: () {
              Get.back();
              Get.back(result: 'DISC35');
            },
          )
        ],
      ),
    );
  }
}

class DiscountOffer extends StatelessWidget {
  const DiscountOffer({
    super.key,
    this.data,
    required this.onTap,
  });
  final Null Function() onTap;
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: "#302D813B".toHex())),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(.5)),
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  data['image'],
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            12.toW,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data['label'].toString().toText(
                    color: "#2A2A2A".toHex(), fontWeight: FontWeight.w700),
                data['subtitle'].toString().toText(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)
              ],
            )
          ],
        ).paddingAll(20),
      ),
    ).marginOnly(bottom: 18).marginSymmetric(horizontal: 20);
  }
}
