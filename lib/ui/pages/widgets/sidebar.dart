import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/complaints/complaint.dart';
import 'package:rideapp/ui/pages/faq/faqs.dart';
import 'package:rideapp/ui/pages/history/history.dart';
import 'package:rideapp/ui/pages/login/login.dart';
import 'package:rideapp/ui/pages/profile/address.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/settings/settings.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/rider/my_earnings.dart';
import 'package:rideapp/ui/rider/rider_profile.dart';
import 'package:rideapp/utils/constants.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key, this.isDriver = false});
  final bool isDriver;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 249,
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 20.toh,
            const CustomHeader(title: ''),
            20.toh,
            Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/Ellipse 43.png",
                      height: 70,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        "assets/Edit Image.png",
                        height: 20,
                      ),
                    ),
                  ],
                )).paddingOnly(left: 16),
            20.toh,
            "Nate Samson"
                .toText(fontSize: 18, color: "#414141".toHexColor())
                .paddingSymmetric(horizontal: 16),
            8.toh,
            "nate@email.com"
                .toText(fontSize: 12, color: "#414141".toHexColor())
                .paddingSymmetric(horizontal: 16),
            20.toh,
            Column(
              children: [
                if (isDriver) ...[
                  SidebarMenu(
                    icon: "assets/icons/user.png",
                    label: "My Earnings",
                    onTap: () => Get.to(() => const MyEarnings()),
                  ),
                  const Divider(),
                  SidebarMenu(
                    icon: "assets/icons/user.png",
                    label: "Edit Profile",
                    onTap: () => Get.to(() => AppEnv.RIDER == Constants.appEnv
                        ? const RiderProfile()
                        : const Profile()),
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const History()),
                    icon: "assets/icons/History.png",
                    label: "History",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const Complaints()),
                    icon: "assets/icons/Complain.png",
                    label: "Report an issue",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const FAQs()),
                    icon: "assets/icons/About Us.png",
                    label: "FAQs",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const Settings()),
                    icon: "assets/icons/Settings.png",
                    label: "Settings",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const SignIn()),
                    icon: "assets/icons/Logout.png",
                    label: "Logout",
                  ),
                  const Divider()
                ] else ...[
                  SidebarMenu(
                    icon: "assets/icons/user.png",
                    label: "Edit Profile",
                    onTap: () => Get.to(() => const Profile()),
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const Address()),
                    icon: "assets/icons/Map.png",
                    label: "Address",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const History()),
                    icon: "assets/icons/History.png",
                    label: "History",
                  ),
                  const Divider(),
                  36.toh,
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const Complaints()),
                    icon: "assets/icons/Complain.png",
                    label: "Report an issue",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const FAQs()),
                    icon: "assets/icons/About Us.png",
                    label: "FAQs",
                  ),
                  const Divider(),
                  SidebarMenu(
                    onTap: () => Get.to(() => const Settings()),
                    icon: "assets/icons/Settings.png",
                    label: "Settings",
                  ),
                  const Divider(),
                  40.toh,
                  // Divider(),
                  SidebarMenu(
                    onTap: () => Constants.appSettings.logout(),
                    icon: "assets/icons/Logout.png",
                    label: "Logout",
                  ),
                  // Divider(),
                  // SidebarMenu(
                  //   onTap: () => Get.to(() => const SignIn()),
                  //   icon: "assets/icons/Logout.png",
                  //   label: "Logout",
                  // ),
                  const Divider()
                ]
                // const Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 16,
          ),
          12.toW,
          label.toText(fontSize: 12, color: "#414141".toHexColor())
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 12),
    );
  }
}
