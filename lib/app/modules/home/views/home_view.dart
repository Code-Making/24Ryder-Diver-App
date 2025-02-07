import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/home_screen.dart';
import 'package:rideapp/ui/pages/home/widgets/sidebar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.globalKey,
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      drawer: const SafeArea(child: SideBarWidget()),
      body: SafeArea(
        child: Stack(
          children: [
            const MapWidget(),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50.h,
                child: Row(children: [
                  InkWell(
                    onTap: () =>
                        controller.globalKey.currentState?.openDrawer(),
                    child: const Icon(
                      Icons.menu,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.radio_button_checked,
                    color: Colors.green,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text("Current Location/Pickup point",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade800)),
                  ),
                ]),
              ),
            ),
            const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomSheetWidget(
                  height: 394,
                  child: HomeBottomSheet(),
                ))
          ],
        ),
      ),
    );
  }
}
