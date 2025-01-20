import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationOnGoogleMapScreen extends StatefulWidget {
  const CurrentLocationOnGoogleMapScreen({super.key});

  @override
  State<CurrentLocationOnGoogleMapScreen> createState() =>
      _CurrentLocationOnGoogleMapScreenState();
}

class _CurrentLocationOnGoogleMapScreenState
    extends State<CurrentLocationOnGoogleMapScreen> {
  Completer<GoogleMapController> mController = Completer<GoogleMapController>();
  LatLng? currentLocation;

  /// get map Permission
  /// fetch location

  /// here we create function to fetch current location
  void getCurrentLocation() async {
    bool canFetchLocation = await checkLocationPermission();

    /// here we check location permission
    if (canFetchLocation) {
      var currentPosition = await Geolocator.getCurrentPosition();
      currentLocation =
          LatLng(currentPosition.latitude, currentPosition.longitude);
      setState(() {});
      var mapController = await mController.future;
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 17,
          bearing: 40.7)));
    }
  }

  /// here we create function for fetch current locations
  Future<bool> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Location Permission is not Granted!")));
          return false;
        } else if (permission == LocationPermission.deniedForever) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Location Permission denied forever!")));
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Location service not enable!"),
        action: SnackBarAction(
            label: "Permission",
            onPressed: () {
              /// in action we open app location setting
              /// if user denied two permission
              Geolocator.openLocationSettings();
            }),
      ));
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Current Location"),
      ),

      /// show google map
      body: GoogleMap(
          onMapCreated: (controller) {
            mController.complete(controller);
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          rotateGesturesEnabled: true,
          indoorViewEnabled: true,
          trafficEnabled: true,
          /// here we set marker
          markers: {
            Marker(
                markerId: const MarkerId("Current Location"),

                /// if current location is not fetch then show asia map
                position: currentLocation ?? const LatLng(34.0479, 100.6197),
                onTap: () {
                  print("Tapped on marker");
                },
                infoWindow: const InfoWindow(
                    title: "Current Location", snippet: "Use GPS"))
          },
          mapType: MapType.satellite,
          initialCameraPosition: const CameraPosition(
              target: LatLng(25.197525, 55.274288), zoom: 17, bearing: 40.7)),
    );
  }
}

/// check current location on real device
///
/// check in real device
/// Check Complete code
///
/// _______________FINAL TEST ____________________///
