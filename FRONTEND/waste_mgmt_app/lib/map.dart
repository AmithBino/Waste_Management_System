import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'user/pickup.dart';

// import 'package:latlng/latlng.dart';
String googleApiKey = "AIzaSyD8QINHhrZBvd2TT9nF1zU9SjMHdCUkNkY";

class Maps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Maps> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourcelocation = LatLng(9.6265, 76.7755);
  static const LatLng destination = LatLng(9.6361, 76.7769);
  // static const LatLng destination = LatLng(9.6361, 76.7769);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        setState(() => currentLocation = location);
      },
    );
  }

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     googleApiKey,
  //     PointLatLng(sourcelocation.latitude, sourcelocation.longitude),
  //     PointLatLng(destination.latitude, destination.longitude),
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (PointLatLng point) => polylineCoordinates.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    getCurrentLocation();
    // getPolyPoints();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   getPolyPoints();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xff1FAB89),
          elevation: 10.0,
          toolbarHeight: 50,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Map"),
              Container(padding: const EdgeInsets.all(25.0))
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(14))),
        ),
        body: currentLocation == null
            ? const Center(child: Text("Loading"))
            : GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 14.5),
                // polylines: {
                //     Polyline(
                //       polylineId: PolylineId('route'),
                //       points: polylineCoordinates,
                //       color: Color(0xFF4285F4),
                //       width: 6,
                //     ),
                //   },
                markers: {
                    Marker(
                      markerId: const MarkerId("Current Location"),
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                    ),
                    const Marker(
                      markerId: MarkerId("Source"),
                      position: sourcelocation,
                    ),
                    const Marker(
                      markerId: MarkerId("Destination"),
                      position: destination,
                    )
                  }));
  }
}
