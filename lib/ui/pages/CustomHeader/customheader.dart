import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/chat/chat.dart';

import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

var blurredContianer = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        blurRadius: 1,
        // spreadRadius: 1,
        offset: const Offset(0, 3),
        color: Colors.grey.shade200,
      )
    ]
    // box-shadow: 0px 4px 10px 0px #00000012;

    );

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  var promo = '';
  final couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomHeader(title: 'Payment Method'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    30.toh,
                    InkWell(
                      // onTap: () async {
                      //   var result = await Get.to(const ApplyCoupon());
                      //   setState(() {
                      //     promo = result.toString();
                      //   });
                      //   couponController.text = result;
                      // },
                      child: Container(
                        height: 54.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                // spreadRadius: 1,
                                offset: const Offset(0, 3),
                                color: Colors.grey.shade200,
                              )
                            ]
                            // box-shadow: 0px 4px 10px 0px #00000012;

                            ),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apply Coupon",
                              style: Get.textTheme.titleMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    20.toh,
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 50.h,
                            child: TextField(
                              controller: couponController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(50)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: 'Enter Coupon Code',
                                  hintStyle: TextStyle(
                                      color: "#B4B4B4".toHex(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                        20.toW,
                        Expanded(
                          child: AppButton(
                            isRounded: true,
                            label: promo.isEmpty ? 'Apply' : "Applied",
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    40.toh,
                    Row(
                      children: [
                        "Add New Card".toLargeText18,
                        const Spacer(),
                        Icon(
                          Icons.add,
                          color: Palette.primary,
                          size: 28,
                        )
                      ],
                    ),
                    20.toh,
                    Container(
                      height: 68.h,
                      decoration: blurredContianer,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/filename@3x.png",
                            height: 16,
                          ),
                          18.toW,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ...List.generate(
                                      4,
                                      (i) => const Padding(
                                            padding:
                                                EdgeInsets.only(right: 4.0),
                                            child: Icon(
                                              Icons.circle,
                                              size: 5,
                                            ),
                                          )).toList(),
                                  8.toW,
                                  ...List.generate(
                                      4,
                                      (i) => const Padding(
                                            padding:
                                                EdgeInsets.only(right: 4.0),
                                            child: Icon(
                                              Icons.circle,
                                              size: 5,
                                            ),
                                          )).toList(),
                                  8.toW,
                                  "52".toMediumText14,
                                  8.toW,
                                  "2456".toMediumText14,
                                ],
                              ),
                              "Expiry 04 july 2023".toSmallText10,
                            ],
                          )
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 18),
                    ),
                    20.toh,
                    Container(
                      height: 68.h,
                      decoration: blurredContianer,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 44,
                            child: Image.asset(
                              "assets/filename(1)@3x.png",
                              width: 14,
                              height: 18,
                            ),
                          ),
                          12.toW,
                          "Paypal".toLargeText16bold
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 20),
                    ),
                    20.toh,
                    Container(
                      height: 68.h,
                      decoration:
                          blurredContianer.copyWith(color: Palette.primary),
                      child: Row(
                        children: [
                          // const SizedBox(height: 47, child: CashWithCircle()),
                          12.toW,
                          "Cash".toText(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ).paddingSymmetric(horizontal: 16, vertical: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const BookRide().marginOnly(bottom: 20, left: 18, right: 18),
    );
  }
}

class BookRide extends StatelessWidget {
  const BookRide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
        20.toW,
        SizedBox(
          height: 50,
          width: 258,
          child: AppButton(
            isRounded: true,
            label: "Book Ride",
            onPressed: () {
              Get.to(() => const ChatScreen());
            },
          ),
        ),
      ],
    );
  }
}

class CustomHeader extends StatelessWidget {
  final String title;

  // Constructor to allow custom title text
  const CustomHeader(
      {super.key,
      required this.title,
      this.addpadding = true,
      this.roundedBackButton = false});
  final bool addpadding;
  final bool roundedBackButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // Height of the header, same as AppBar default height
      padding: EdgeInsets.symmetric(
          horizontal: addpadding ? 16.0 : 0), // Horizontal padding for content

      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back Button with Icon and Text
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Get.back(),
              child: roundedBackButton
                  ? Row(
                      children: [
                        Container(
                          height: 41,
                          width: 41,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(color: Colors.grey)],
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                          ),
                        ),
                      ],
                    ).marginOnly(left: 12)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 16, // Icon size
                            // color: Colors.b, // Icon color
                          ),
                          const SizedBox(
                              width: 4.0), // Space between icon and text
                          Text(
                            "Back", // Text next to the icon
                            overflow: TextOverflow
                                .ellipsis, // In case text is too long
                            style: TextStyle(
                              fontSize: 16.0, // Text size
                              color: "background: #414141;".toHexColor(),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          // Centered title text (like AppBar's title)
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Get.theme.appBarTheme.titleTextStyle?.copyWith(
                color: Colors.black, // Set text color to black
              ),
            ),
          )
        ],
      ),
    );
  }
}
