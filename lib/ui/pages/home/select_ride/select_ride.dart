import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rideapp/ui/pages/home/home_screen.dart';
import 'package:rideapp/ui/pages/home/widgets/waiting_screen.dart';
import 'package:rideapp/ui/pages/utils/colors.dart';
import 'package:rideapp/ui/pages/widgets/app_button.dart';

class SelectRidePage extends StatefulWidget {
  const SelectRidePage({super.key});

  @override
  State<SelectRidePage> createState() => _SelectRidePageState();
}

class _SelectRidePageState extends State<SelectRidePage> {
  var selectedRide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                // blurRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(4)),
                        margin: const EdgeInsets.only(right: 16),
                        child: //Text("13 Dec,\n 01:50 PM") ??
                            Image.asset(
                          'assets/clock-two-svgrepo-com 1.png',
                          width: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BottomSheetWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Available Rides",
                                style: Get.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RidesWidget(
                            isSelected: selectedRide == 1,
                            image: 'assets/cars/car (1).png',
                            name: 'Micro',
                            person: '4+1 Person',
                            amount: '\$20.00',
                            onTap: () {
                              setState(() {
                                selectedRide = 1;
                              });
                            },
                          ),
                          RidesWidget(
                            isSelected: selectedRide == 2,
                            image: 'assets/cars/Car.png',
                            name: 'Bajaji',
                            person: '4+1 Person',
                            amount: '\$10.00',
                            onTap: () {
                              setState(() {
                                selectedRide = 2;
                              });
                            },
                          ),
                          RidesWidget(
                            isSelected: selectedRide == 3,
                            image: 'assets/cars/Car.png',
                            name: 'Mini',
                            person: '1 Person',
                            amount: '\$5.00',
                            onTap: () {
                              setState(() {
                                selectedRide = 3;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: AppButton(
                              isRounded: true,
                              label: 'Book Ride',
                              onPressed: () {
                                Get.to(const WithMap(child: WaitingScreen()));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            // Positioned(
            //     top: 140, left: 120, child: Image.asset('assets/Path.png'))
          ],
        ),
      ),
    );
  }
}

class RidesWidget extends StatelessWidget {
  const RidesWidget({
    super.key,
    this.isSelected = false,
    required this.onTap,
    required this.image,
    required this.name,
    required this.person,
    required this.amount,
  });
  final Function() onTap;
  final String image;
  final String name;
  final String person;
  final String amount;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? Palette.primary : null,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? null
                  : Border.all(
                      color: Colors.grey.shade200,
                    )),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 58,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    person,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                amount,
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
