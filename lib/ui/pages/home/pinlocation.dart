import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/home_screen.dart';
import 'package:rideapp/ui/pages/home/search_dorp_screen.dart';
import 'package:rideapp/ui/pages/home/search_pickup_screen.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';

class PinPickupLocation extends StatefulWidget {
  const PinPickupLocation({super.key});

  @override
  State<PinPickupLocation> createState() => _PinPickupLocationState();
}

class _PinPickupLocationState extends State<PinPickupLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  const Icon(Icons.menu),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.radio_button_checked,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("XTRI- Din Tai Fung",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade800)),
                ]),
              ),
            ),
            Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: AppButton(
                  label: 'Confirm Pickup',
                  onPressed: () {
                    Get.to(() => const SearchDropScreen());
                  },
                )),
            Positioned(
                top: 280,
                left: 60,
                right: 120,
                child: Image.asset(
                  'assets/ic_Pin-2.png',
                  height: 40,
                )),
          ],
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 394,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Where are you going today?",
                  style: Get.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => Get.to(() => const SearchPickupScreen()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomInputField(
                  onTap: () {
                    Get.to(() => const SearchPickupScreen());
                  },
                  enabled: false,
                  backgroundColor: "#F7F6FF".toHex(),
                  hintText: "Where would you go?",
                  prefix: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Image.asset(
                      "assets/heart.png",
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (i, _) => const HistoryLocation(),
                separatorBuilder: (i, _) => Divider(
                      color: Colors.grey.shade200,
                    ),
                itemCount: 5),
            Divider(
              color: Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
