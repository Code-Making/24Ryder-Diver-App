import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/ui/pages/otp/otp.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/textstyles.dart';

import '../controllers/verifyotp_controller.dart';

class VerifyotpView extends GetView<VerifyotpController> {
  const VerifyotpView({super.key});
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
                Center(
                  child: Text(
                    "Phone Verification",
                    style: Get.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Enter your OTP Code",
                    style: Get.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        // alignment: Alignment.center,
                        width: double.infinity, // Makes it flexible
                        child: PinCodeTextField(
                          controller: controller.otp,
                          enableActiveFill: true,
                          obscureText: false,
                          autoFocus: true,
                          appContext: context,
                          length: 5,
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Change from spaceBetween
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
                            fieldWidth: 50,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Didn't receive code? ",
                              style: Get.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(const Otp()),
                              text: "Resend again",
                              style: Get.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Palette.primary,
                              ),
                            )
                          ])),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                // AppButton(
                //   label: 'Verify',
                //   onPressed: () {
                //     controller.onVerify();
                //     Get.toNamed(Routes.RIDER_DOCUMENT_UPLOAD);
                //   },
                // ),
                Obx(() => AppButton(
                      label: controller.isLoading.value
                          ? 'Verifying...'
                          : 'Verify',
                      onPressed: () async {
                        bool isVerified = await controller.onVerify();
                        if (isVerified) {
                          Get.toNamed(Routes.RIDER_DOCUMENT_UPLOAD);
                        }
                      },
                    )),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
