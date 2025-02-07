import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/ui/pages/otp/otp.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';
import 'package:rideapp/ui/pages/widgets/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const MapWidget() ??
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const BackButtonWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Sign in",
                    style: Get.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const CustomInputField(
                    hintText: 'Email or Phone',
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  AppButton(
                    label: 'Sign in',
                    onPressed: () {
                      // Get.to(() => const Home());
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(child: Divider()),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "or",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(child: Divider()),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/Gmail(1).png",
                                height: 24,
                              ))),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/Facebook.png",
                                height: 24,
                              ))),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Get.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          "Sign up",
                          style: Get.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Palette.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
      ),
    );
  }
}
