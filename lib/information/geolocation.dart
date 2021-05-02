import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  GoogleMapController mapController;
  var church = LatLng(-23.5036509, -46.4922004);

  void _onMapCreated(GoogleMapController controller) {
    MapHelper.mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        rotateGesturesEnabled: false,
        compassEnabled: true,
        markers: <Marker>[].toSet(),
        initialCameraPosition: CameraPosition(
          bearing: 270.0,
          target: church,
          tilt: 30.0,
          zoom: 17.0,
        ),
      ),
    );
  }
}

class MapHelper {
  static GoogleMapController _mapController;
  static GoogleMapController get mapController => _mapController;
  static set mapController(GoogleMapController controller) {
    if (_mapController == null) _mapController = controller;
  }
}
