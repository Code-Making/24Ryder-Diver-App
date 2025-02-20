import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/home.dart';
import 'package:rideapp/ui/pages/widgets/sidebar.dart';
import 'package:rideapp/ui/pages/widgets/waiting.dart';
import 'package:rideapp/ui/rider/controller/home_api_service/ride_controller.dart';
import 'package:rideapp/ui/rider/controller/home_api_service/shimmer.dart';
import 'package:rideapp/ui/rider/rider_profile.dart';
import 'package:rideapp/ui/rider/start_pickup.dart';
import 'package:shimmer/shimmer.dart';

class RiderHome extends StatefulWidget {
  const RiderHome({super.key});

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: globalKey,
      drawer: const SafeArea(child: SideBarWidget(isDriver: true)),
      body: Base(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => globalKey.currentState?.openDrawer(),
              child: Image.asset(
                'assets/rider/filename.png',
                height: 20,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiderProfile(),
                  ),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/rider/Group 11305.png',
                    height: 51,
                  ),
                  6.toW,
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      "Hello Frank".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: "#7E7E7E".toHex(),
                      ),
                      "Dubin US".toText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).padding20top,
        Row(
          children: [
            Expanded(
              child: Container(
                height: 101,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "\$320".toText(fontSize: 24, fontWeight: FontWeight.w600),
                    8.toh,
                    "Overall earning".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: "#7E7E7E".toHex()),
                  ],
                ),
              ).marginSymmetric(vertical: 16),
            ),
            20.toW,
            Expanded(
              child: Container(
                height: 101,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "2".toText(fontSize: 24, fontWeight: FontWeight.w600),
                    8.toh,
                    "Today Booking".toText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: "#7E7E7E".toHex()),
                  ],
                ),
              ).marginSymmetric(vertical: 16),
            ),
          ],
        ),
        16.toh,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "New Request".toLargeText18,
            "View all".toText(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: "#7E7E7E".toHex()),
          ],
        ),
        20.toh,
        const IncomingRequests().marginbottom,
        const IncomingRequests()
      ]),
    );
  }
}

// class IncomingRequests extends StatelessWidget {
//   const IncomingRequests({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const CircleAvatar(
//                 radius: 24,
//                 backgroundImage: AssetImage('assets/Mask group.png'),
//               ),
//               12.toW,
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Row(
//                       children: [
//                         Text(
//                           "Alex Robin",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                     4.toh,
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.watch_later_outlined,
//                           size: 14,
//                           color: Palette.primary,
//                         ),
//                         4.toW,
//                         "15 Min".toText(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: "#717171".toHex()),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   "\$24".toText(fontSize: 16),
//                   "2.4 km".toText(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: "#7E7E7E".toHex()),
//                 ],
//               )
//             ],
//           ),
//           12.toh,
//           const Divider(),
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.radio_button_checked,
//                           color: Colors.green,
//                           size: 24,
//                         ),
//                         8.toW,
//                         const Text(
//                           "Neemuch RD. Gopalbari, Bari Sad",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Image.asset(
//                         "assets/Line 2.png",
//                         // height: 8,
//                         width: 2,
//                       ),
//                     ),
//                     Row(children: [
//                       Image.asset(
//                         'assets/ic_Pin-2.png',
//                         width: 24,
//                       ),
//                       8.toW,
//                       const Text(
//                         "Jawahar Lal Nehru Marg, D-Block",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       const Spacer(),
//                     ])
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           20.toh,
//           Row(
//             children: [
//               const Expanded(
//                 child: AppButton(
//                   label: 'Decline',
//                   isOutlined: true,
//                 ),
//               ),
//               20.toW,
//               Expanded(
//                 child: AppButton(
//                   isRounded: true,
//                   label: 'Accept',
//                   onPressed: () {
//                     Get.to(WithMap(
//                       positionedWidget: Positioned(
//                         top: 2,
//                         left: 0,
//                         right: 0,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomHeader(
//                                 title: 'Start Pickup'.toUpperCase(),
//                                 roundedBackButton: true),
//                             16.toh,
//                             Container(
//                               height: 43.h,
//                               alignment: Alignment.center,
//                               width: double.infinity,
//                               color: "#FFA06B".toHex(),
//                               child: Row(
//                                 children: [
//                                   const Icon(Icons.turn_left_rounded),
//                                   4.toW,
//                                   "220m".toText(),
//                                   20.toW,
//                                   RichText(
//                                       text: const TextSpan(children: [
//                                     TextSpan(
//                                       text: "Turn left ",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.black),
//                                     ),
//                                     TextSpan(
//                                       text: "Neemuch RD. Gopalbari",
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                           color: Colors.black),
//                                     ),
//                                   ]))
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       child: BottomSheetWidget(
//                           child: const StartPickup()
//                               .paddingAll(16)
//                               .paddingOnly(top: 16)),
//                     ));
//                   },
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';

class IncomingRequests extends StatefulWidget {
  const IncomingRequests({super.key});

  @override
  State<IncomingRequests> createState() => _IncomingRequestsState();
}

class _IncomingRequestsState extends State<IncomingRequests> {
  final BookingController bookingController = Get.put(BookingController());

  @override
  void initState() {
    super.initState();
    bookingController.fetchBookingList(1); // Replace with actual driver ID
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (bookingController.isLoading.value) {
        return ShimmerEffect(); // Show shimmer while loading
      }

      if (bookingController.errorMessage.isNotEmpty) {
        return Center(child: Text(bookingController.errorMessage.value));
      }

      if (bookingController.bookingList.isEmpty) {
        return const Center(child: Text("No incoming requests"));
      }

      return Column(
        children: bookingController.bookingList.map((booking) {
          return _buildRequestCard(booking);
        }).toList(),
      );
    });
  }

  Widget _buildRequestCard(Map<String, dynamic> booking) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/Mask group.png'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking["user_name"] ?? "Unknown",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.watch_later_outlined,
                            size: 14, color: Colors.orange),
                        SizedBox(width: 4),
                        Text("${booking["ride_time"]} Min",
                            style: const TextStyle(fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text("\$${booking["total_amount"]}",
                      style: const TextStyle(fontSize: 16)),
                  Text("${booking["distance"]}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.radio_button_checked,
                            color: Colors.green, size: 24),
                        SizedBox(width: 8),
                        Text(booking["pickup_location"] ?? "Unknown"),
                      ],
                    ),
                    8.toW,
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/Line 2.png",
                        // height: 8,
                        width: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset('assets/ic_Pin-2.png', width: 24),
                        SizedBox(width: 8),
                        Text(booking["dropoff_location"] ?? "Unknown"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                child: AppButton(
                  label: 'Decline',
                  isOutlined: true,
                ),
              ),
              SizedBox(width: 20),
              20.toW,
              Expanded(
                child: AppButton(
                  isRounded: true,
                  label: 'Accept',
                  onPressed: () {
                    Get.to(WithMap(
                      positionedWidget: Positioned(
                        top: 2,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomHeader(
                                title: 'Start Pickup'.toUpperCase(),
                                roundedBackButton: true),
                            16.toh,
                            Container(
                              height: 43.h,
                              alignment: Alignment.center,
                              width: double.infinity,
                              color: "#FFA06B".toHex(),
                              child: Row(
                                children: [
                                  const Icon(Icons.turn_left_rounded),
                                  4.toW,
                                  "220m".toText(),
                                  20.toW,
                                  RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                      text: "Turn left ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "Neemuch RD. Gopalbari",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ]))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: BottomSheetWidget(
                          child: const StartPickup()
                              .paddingAll(16)
                              .paddingOnly(top: 16)),
                    ));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
