import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class MapsView extends StatefulWidget {
  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
   Completer<GoogleMapController> _controller = Completer();
   
    static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-4.3720830, 15.3187206),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrouvez-Nous'),
        backgroundColor: Colors.yellow.shade800,
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: Color.fromRGBO(240, 240, 253, 1),
            image: DecorationImage(
                image: AssetImage('asset/img/bg2.jpg'), fit: BoxFit.cover)),
                child: GoogleMap(
                myLocationEnabled: true,
                markers: {Marker(markerId: MarkerId('CEF'), position: const LatLng(-4.3720830, 15.3187206)),},
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      ),
      
    );
  }
}
