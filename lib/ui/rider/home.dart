import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/core/services/pusher_service.dart';
import 'package:rideapp/app/core/utils/sharedprefrences.dart';
import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
import 'package:rideapp/ui/pages/profile/profile.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';
import 'package:rideapp/ui/pages/widgets/home.dart';
import 'package:rideapp/ui/pages/widgets/sidebar.dart';
import 'package:rideapp/ui/pages/widgets/waiting.dart';
import 'package:rideapp/ui/rider/rider_profile.dart';
import 'package:rideapp/ui/rider/start_pickup.dart';
import 'package:http/http.dart' as http;

class RiderHome extends StatefulWidget {
  const RiderHome({super.key});

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  final globalKey = GlobalKey<ScaffoldState>();
  final PusherService pusherService = PusherService();
  List<Map<String, dynamic>> rideRequests = [];
  bool isOnline = true; // Initial state

  @override
  void initState() {
    super.initState();
    initializePusher();
  }

  Future<void> initializePusher() async {
    int? userId = await SharedPrefs.getUserId(); // Retrieve user ID

    if (userId == null) {
      print("❌ User ID not found. Cannot initialize Pusher.");
      return;
    }

    pusherService.initPusher();
    pusherService.onNewRideRequest = (newRequest) {
      setState(() {
        rideRequests.add(newRequest);
      });
    };
  }

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
                    builder: (context) => RiderProfile(),
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
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8, // Increased for a softer shadow
                        spreadRadius: 2, // Makes the shadow more visible
                        offset: Offset(0, 1), // Adds a slight downward effect
                      ),
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
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8, // Increased for a softer shadow
                        spreadRadius: 2, // Makes the shadow more visible
                        offset: Offset(0, 1), // Adds a slight downward effect
                      ),
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
        // 16.toh,
        Row(
          children: [
            Expanded(
              child: Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8, // Increased for a softer shadow
                      spreadRadius: 2, // Makes the shadow more visible
                      offset: Offset(0, 1), // Adds a slight downward effect
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Aligns items in the center
                    children: [
                      Text(
                        isOnline ? "Online" : "Offline",
                        style: TextStyle(
                          fontFamily:
                              'Poppins', // Ensure Poppins is added in pubspec.yaml
                          fontSize: 14, // 14px
                          fontWeight: FontWeight.w600, // 600 weight
                          height: 21 / 14, // Line height = 21px (scaled)
                          letterSpacing: 0.0, // 0% letter spacing
                          color: isOnline
                              ? Color(0xFF43A048)
                              : Colors.red, // #43A048 for Online
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 36, // Set width
                          height: 20, // Set height
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(25), // Border radius 25px
                            border: Border.all(
                                width: 1,
                                color: Colors.grey), // Border width 1px
                          ),
                          child: Switch(
                            value: isOnline,
                            onChanged: (value) {
                              setState(() {
                                isOnline = value;
                              });
                            },
                            activeTrackColor:
                                Color(0xFF43A048), // White track when active
                            activeColor:
                                Colors.white, // Green thumb when active
                            inactiveTrackColor:
                                Colors.red, // White track when inactive
                            inactiveThumbColor:
                                Colors.white, // Red thumb when inactive
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap, // Reduce size
                          ),
                        ),
                      ),
                    ],
                  ),
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

class IncomingRequests extends StatelessWidget {
  const IncomingRequests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/Mask group.png'),
              ),
              12.toW,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Alex Robin",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    4.toh,
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 14,
                          color: Palette.primary,
                        ),
                        4.toW,
                        "15 Min".toText(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: "#717171".toHex()),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  "\$24".toText(fontSize: 16),
                  "2.4 km".toText(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: "#7E7E7E".toHex()),
                ],
              )
            ],
          ),
          12.toh,
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.radio_button_checked,
                          color: Colors.green,
                          size: 24,
                        ),
                        8.toW,
                        const Text(
                          "Neemuch RD. Gopalbari, Bari Sad",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/Line 2.png",
                        // height: 8,
                        width: 2,
                      ),
                    ),
                    Row(children: [
                      Image.asset(
                        'assets/ic_Pin-2.png',
                        width: 24,
                      ),
                      8.toW,
                      const Text(
                        "Jawahar Lal Nehru Marg, D-Block",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                    ])
                  ],
                ),
              ),
            ],
          ),
          20.toh,
          Row(
            children: [
              const Expanded(
                child: AppButton(
                  label: 'Decline',
                  isOutlined: true,
                ),
              ),
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
          )
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:rideapp/app/core/services/pusher_service.dart';
// import 'package:rideapp/app/core/utils/sharedprefrences.dart';
// import 'package:rideapp/ui/pages/CustomHeader/customheader.dart';
// import 'package:rideapp/ui/pages/chat/chat.dart';
// import 'package:rideapp/ui/pages/profile/profile.dart';
// import 'package:rideapp/ui/pages/utils/colors.dart';
// import 'package:rideapp/ui/pages/utils/extension.dart';
// import 'package:rideapp/ui/pages/widgets/app_button.dart';
// import 'package:rideapp/ui/pages/widgets/home.dart';
// import 'package:rideapp/ui/pages/widgets/sidebar.dart';
// import 'package:rideapp/ui/pages/widgets/waiting.dart';
// import 'package:rideapp/ui/rider/rider_profile.dart';
// import 'package:rideapp/ui/rider/start_pickup.dart';
// import 'package:http/http.dart' as http;

// import '../pages/success/destination_arrived.dart';

// class RiderHome extends StatefulWidget {
//   const RiderHome({super.key});

//   @override
//   State<RiderHome> createState() => _RiderHomeState();
// }

// class _RiderHomeState extends State<RiderHome> {
//   final globalKey = GlobalKey<ScaffoldState>();
//   final PusherService pusherService = PusherService();
//   List<Map<String, dynamic>> rideRequests = [];
//   bool isOnline = true; // Initial state

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   pusherService.initPusher("driver123"); // Use dynamic driverId
//   //   pusherService.onNewRideRequest = (newRequest) {
//   //     setState(() {
//   //       rideRequests.add(newRequest);
//   //     });
//   //   };
//   // }
//   @override
//   void initState() {
//     super.initState();
//     initializePusher();
//   }

//   Future<void> initializePusher() async {
//     int? userId = await SharedPrefs.getUserId(); // Retrieve user ID

//     if (userId == null) {
//       print("❌ User ID not found. Cannot initialize Pusher.");
//       return;
//     }

//     pusherService.initPusher();
//     pusherService.onNewRideRequest = (newRequest) {
//       setState(() {
//         rideRequests.add(newRequest);
//       });
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       key: globalKey,
//       drawer: const SafeArea(child: SideBarWidget(isDriver: true)),
//       body: Base(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () => globalKey.currentState?.openDrawer(),
//                 child: Image.asset(
//                   'assets/rider/filename.png',
//                   height: 20,
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RiderProfile(),
//                     ),
//                   );
//                 },
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'assets/rider/Group 11305.png',
//                       height: 51,
//                     ),
//                     6.toW,
//                     Column(
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start, // Align text to the left
//                       children: [
//                         "Hello Frank".toText(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: "#7E7E7E".toHex(),
//                         ),
//                         "Dubin US".toText(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ).padding20top,
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 101,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           blurRadius: 8, // Increased for a softer shadow
//                           spreadRadius: 2, // Makes the shadow more visible
//                           offset: Offset(0, 1), // Adds a slight downward effect
//                         ),
//                       ]),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       "\$320".toText(fontSize: 24, fontWeight: FontWeight.w600),
//                       8.toh,
//                       "Overall earning".toText(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: "#7E7E7E".toHex()),
//                     ],
//                   ),
//                 ).marginSymmetric(vertical: 16),
//               ),
//               20.toW,
//               Expanded(
//                 child: Container(
//                   height: 101,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           blurRadius: 8, // Increased for a softer shadow
//                           spreadRadius: 2, // Makes the shadow more visible
//                           offset: Offset(0, 1), // Adds a slight downward effect
//                         ),
//                       ]),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       "2".toText(fontSize: 24, fontWeight: FontWeight.w600),
//                       8.toh,
//                       "Today Booking".toText(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: "#7E7E7E".toHex()),
//                     ],
//                   ),
//                 ).marginSymmetric(vertical: 16),
//               ),
//             ],
//           ),
//           // 16.toh,
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 80,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         blurRadius: 8, // Increased for a softer shadow
//                         spreadRadius: 2, // Makes the shadow more visible
//                         offset: Offset(0, 1), // Adds a slight downward effect
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment
//                           .center, // Aligns items in the center
//                       children: [
//                         Text(
//                           isOnline ? "Online" : "Offline",
//                           style: TextStyle(
//                             fontFamily:
//                                 'Poppins', // Ensure Poppins is added in pubspec.yaml
//                             fontSize: 14, // 14px
//                             fontWeight: FontWeight.w600, // 600 weight
//                             height: 21 / 14, // Line height = 21px (scaled)
//                             letterSpacing: 0.0, // 0% letter spacing
//                             color: isOnline
//                                 ? Color(0xFF43A048)
//                                 : Colors.red, // #43A048 for Online
//                           ),
//                         ),
//                         const Spacer(),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             width: 36, // Set width
//                             height: 20, // Set height
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(
//                                   25), // Border radius 25px
//                               border: Border.all(
//                                   width: 1,
//                                   color: Colors.grey), // Border width 1px
//                             ),
//                             child: Switch(
//                               value: isOnline,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isOnline = value;
//                                 });
//                               },
//                               activeTrackColor:
//                                   Color(0xFF43A048), // White track when active
//                               activeColor:
//                                   Colors.white, // Green thumb when active
//                               inactiveTrackColor:
//                                   Colors.red, // White track when inactive
//                               inactiveThumbColor:
//                                   Colors.white, // Red thumb when inactive
//                               materialTapTargetSize: MaterialTapTargetSize
//                                   .shrinkWrap, // Reduce size
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ).marginSymmetric(vertical: 16),
//               ),
//             ],
//           ),

//           16.toh,
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     "New Request".toLargeText18,
//           //     "View all".toText(
//           //         fontSize: 12,
//           //         fontWeight: FontWeight.w400,
//           //         color: "#7E7E7E".toHex()),
//           //   ],
//           // ),
//           // 20.toh,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               "New Request".toLargeText18,
//               InkWell(
//                 onTap: () {
//                   Get.to(() => ChatScreen());
//                 },
//                 child: "View all".toText(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: "#7E7E7E".toHex(),
//                 ),
//               ),
//             ],
//           ),
//           20.toh,

//           // Show dynamic incoming requests
//           rideRequests.isNotEmpty
//               ? Column(
//                   children: rideRequests
//                       .map((request) => IncomingRequests(
//                           data: request, onAccept: acceptRideRequest))
//                       .toList(),
//                 )
//               : "No new requests".toText(fontSize: 14, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   void acceptRideRequest(Map<String, dynamic> request) async {
//     // Make API call when the accept button is tapped
//     final response = await http.post(
//       Uri.parse("http://localhost/Inventory_Management_System/api/accept_ride"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"ride_id": request["id"], "driver_id": "driver123"}),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         rideRequests.remove(request);
//       });
//       Get.to(WithMap(
//         positionedWidget: Positioned(
//           top: 2,
//           left: 0,
//           right: 0,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomHeader(
//                   title: 'Start Pickup'.toUpperCase(), roundedBackButton: true),
//               16.toh,
//               Container(
//                 height: 43.h,
//                 alignment: Alignment.center,
//                 width: double.infinity,
//                 color: "#FFA06B".toHex(),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.turn_left_rounded),
//                     4.toW,
//                     "220m".toText(),
//                     20.toW,
//                     RichText(
//                         text: const TextSpan(children: [
//                       TextSpan(
//                         text: "Turn left ",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black),
//                       ),
//                       TextSpan(
//                         text: "Neemuch RD. Gopalbari",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black),
//                       ),
//                     ]))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         child: BottomSheetWidget(
//           child: const StartPickup().paddingAll(16).paddingOnly(top: 16),
//         ),
//       ));
//     }
//   }
// }

// class IncomingRequests extends StatelessWidget {
//   final Map<String, dynamic> data;
//   final Function(Map<String, dynamic>) onAccept;

//   const IncomingRequests(
//       {super.key, required this.data, required this.onAccept});

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
//                   radius: 24,
//                   backgroundImage: AssetImage('assets/Mask group.png')),
//               12.toW,
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(data["customer_name"],
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600)),
//                     4.toh,
//                     Row(
//                       children: [
//                         Icon(Icons.watch_later_outlined,
//                             size: 14, color: Palette.primary),
//                         4.toW,
//                         "${data["pickup_time"]} Min"
//                             .toText(fontSize: 12, color: "#717171".toHex()),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   "\$${data["fare"]}".toText(fontSize: 16),
//                   "${data["distance"]} km"
//                       .toText(fontSize: 12, color: "#7E7E7E".toHex()),
//                 ],
//               )
//             ],
//           ),
//           12.toh,
//           const Divider(),
//           Row(
//             children: [
//               Expanded(
//                 child: AppButton(label: 'Decline', isOutlined: true),
//               ),
//               20.toW,
//               Expanded(
//                 child: AppButton(
//                   isRounded: true,
//                   label: 'Accept',
//                   onPressed: () => onAccept(data),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
