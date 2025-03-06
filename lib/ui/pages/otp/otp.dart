import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/textstyles.dart';

import '../../rider/home.dart';
import '../widgets/home.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const BackButtonWidget(),
                const SizedBox(
                  height: 80,
                ),
                const Center(
                    child: Text(
                  "Phone Verification",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500, // Matches font-weight: 500
                    fontSize: 24, // Matches font-size: 24px
                    height: 30 / 24, // Equivalent to line-height: 30px
                    letterSpacing: 0, // No letter spacing
                    color: Color(0xFF2A2A2A), // Hex #2A2A2A
                  ),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "Enter your OTP Code",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height:
                        1.5, // Equivalent to line-height: 24px (24/16 = 1.5)
                    letterSpacing: 0,
                    color: Color(0xFFA0A0A0), // Hex color #A0A0A0
                  ),
                )),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 340.w,
                        child: PinCodeTextField(
                          enableActiveFill: true,
                          obscureText: false,
                          autoFocus: true,
                          appContext: context,
                          length: 5,
                          onChanged: (String value) {},
                          textStyle: AppTextStyles.large,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {},
                          inputFormatters: const [
                            // FilteringTextInputFormatter.digitsOnly,
                            // LengthLimitingTextInputFormatter(4),
                          ],
                          cursorColor: Colors.transparent,
                          autoDisposeControllers: false,
                          animationType: AnimationType.none,
                          pinTheme: PinTheme(
                            borderWidth: 1,
                            fieldHeight: 48,
                            fieldWidth: 52,
                            shape: PinCodeFieldShape.box,
                            inactiveFillColor: Colors.white,
                            activeColor: Palette.primary,
                            selectedColor: Palette.primary,
                            selectedFillColor: Colors.white,
                            activeFillColor:
                                const Color.fromRGBO(247, 246, 255, 1),
                            inactiveColor: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Didn't receive code? ",
                                style: Get.textTheme.bodyLarge?.copyWith(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  height:
                                      1.4375, // Equivalent to line-height: 23px (23/16 = 1.4375)
                                  letterSpacing: 0,
                                  color: const Color(
                                      0xFFA0A0A0), // Hex color #A0A0A0 (grey shade)
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(const Otp()),
                                text: "Resend again",
                                style: Get.textTheme.bodyLarge?.copyWith(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  height: 1.4375,
                                  letterSpacing: 0,
                                  color: Palette.primary, // Primary color
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                AppButton(
                    label: 'Verify',
                    onPressed: () {
                      Get.to(() => RiderHome());
                    }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              weight: 1,
              color: Colors.grey.shade700,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Back",
              style: Get.textTheme.bodyLarge?.copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 23 / 16, // Line height
                letterSpacing: 0,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
