import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/custom_input.dart';
import 'package:rideapp/ui/pages/widgets/searchpickup.dart';
import 'package:rideapp/ui/pages/widgets/sidebar.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
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
                    onTap: () => globalKey.currentState?.openDrawer(),
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

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    this.height,
    required this.child,
  });

  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
    );
  }
}

class HistoryLocation extends StatelessWidget {
  const HistoryLocation({
    super.key,
    this.title,
    this.subtitle,
    this.icon,
  });
  final String? title;
  final String? subtitle;
  final Widget? icon;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
      child: Row(
        children: [
          icon ??
              Icon(
                Icons.watch_later_outlined,
                size: 16,
                weight: 1,
                color: Colors.grey.shade300,
              ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? "Steak Resturant",
                  style: Get.textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              Text(
                subtitle ?? "8 Norman St, East Sydney, NSW 2010",
                style: Get.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const _pGooglePlex = LatLng(37.42796133580664, -122.085749655962);
  static const _pLakePlex = LatLng(37.43296265331129, -122.08832357078792);
  LatLng? _currentP;
  final Location _locationController = Location();
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Map<PolylineId, Polyline> polylines = {};

  Future<void> getLocationUpdates() async {
    bool servicesEnabled;
    PermissionStatus permissionGranted;
    servicesEnabled = await _locationController.serviceEnabled();
    if (servicesEnabled) {
      servicesEnabled = await _locationController.requestService();
    } else {
      return;
    }
    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      // print(currentLocation.latitude);
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        if (context.mounted) {
          setState(() {
            _currentP =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
            _cameraToPosition(_currentP!);

            getPolylinePoints().then((coordinates) {
              // initMarkers();
              generatePolyLineFromPoints(coordinates);
            });
          });
        }
      }
    });
  }

  Set<Marker> markers = {};

  initMarkers() async {
    markers = {};

    markers.add(Marker(
      markerId: const MarkerId("2"),
      position: LatLng(_pLakePlex.latitude + 5, _pLakePlex.longitude + 4),
      icon: await Image.asset('assets/cars/Car.png').toBitmapDescriptor(
          logicalSize: const Size(20, 20), imageSize: const Size(100, 100)),
    ));

    setState(() {});
    markers.add(Marker(
      markerId: const MarkerId("1"),
      position: _pGooglePlex,
      icon: await Image.asset(
        'assets/icons/Map.png',
        color: Colors.red,
      ).toBitmapDescriptor(
          logicalSize: const Size(100, 100), imageSize: const Size(100, 100)),
    ));
    setState(() {});
    markers.add(Marker(
      markerId: const MarkerId("3"),
      position: _pLakePlex,
      icon: await Image.asset('assets/cars/car (1).png').toBitmapDescriptor(
          logicalSize: const Size(150, 150), imageSize: const Size(100, 100)),
    ));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    initMarkers();
    super.initState();
    getLocationUpdates().then((_) => {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mapController.future.then((ctlrer) => ctlrer.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _currentP == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GoogleMap(
              mapType: MapType.normal,
              markers: markers ??
                  {
                    Marker(
                        markerId: const MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _currentP!),
                    const Marker(
                        markerId: MarkerId("_sourceLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pGooglePlex),
                    const Marker(
                        markerId: MarkerId("_destinationLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _pLakePlex)
                  },
              onTap: (LatLng pos) async {
                var icon = await const Text('hello').toBitmapDescriptor(
                    logicalSize: const Size(150, 150),
                    imageSize: const Size(150, 150));
                markers.add(Marker(
                    markerId: const MarkerId("3"),
                    position: LatLng(pos.latitude, pos.longitude),
                    icon: icon));
              },
              polylines: Set<Polyline>.of(polylines.values),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
            ) ??
            Image.asset(
              "assets/WhatsApp Image 2022-05-14 at 10.51 1.png",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos, zoom: 15);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
            origin: PointLatLng(_currentP!.latitude, _currentP!.longitude),
            destination:
                PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
            mode: TravelMode.driving),
        googleApiKey: 'AIzaSyATN1MJVNxRQWy-H-IPZ5aeVjLS2sRAB6A');
    if (result.points.isNotEmpty) {
      for (var pointLatLng in result.points) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    if (context.mounted) {
      setState(() {
        polylines[id] = polyline;
      });
    }
  }
}

class CountWidget extends StatelessWidget {
  const CountWidget({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text('$count'),
    );
  }
}
