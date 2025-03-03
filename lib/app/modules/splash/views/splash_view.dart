import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/utils/constants.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: const Size(393, 852),
    );
    controller.count;
    return Scaffold(
      backgroundColor: "#2e2c7f".toHex(),
      body: Center(
          child: Constants.appEnv == AppEnv.RIDER
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/splash.png",
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 100,
                      child: Image.asset(
                        "assets/Text.png",
                        width: 119,
                      ),
                    ),
                  ],
                )
              : Image.asset(
                  "assets/splash.png",
                  width: double.infinity,
                )),
    );
  }
}
