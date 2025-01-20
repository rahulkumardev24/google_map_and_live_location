import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Map"),),
      /// here we show google map
      body: const GoogleMap(
        mapType: MapType.satellite,

          zoomGesturesEnabled: true,
          indoorViewEnabled: true,
          initialCameraPosition: CameraPosition(
        /// latitude abd longitude
          target: LatLng(28.612894, 77.229446) ,
        zoom: 18 ,
        tilt: 40.65 ,
      ) ),
    ) ;
  }
}

/// in next video track live location
///
///
