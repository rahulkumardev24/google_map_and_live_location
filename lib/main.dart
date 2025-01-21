import 'package:flutter/material.dart';
import 'package:google_map_and_live_location/screen/current_location_on_google_map_screen.dart';
import 'package:google_map_and_live_location/screen/google_map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const CurrentLocationOnGoogleMapScreen()

    );
  }
}

/// in this video we show user current location on Google Map
///
/// In First Video we show google map And Also get API (Google API)
/// If You Have't seen First Video Seen then Watch it it first
/// How to get this api KEY  , we discuss in First Video
/// First Watch Google Map First Video
/// Know Start
///
