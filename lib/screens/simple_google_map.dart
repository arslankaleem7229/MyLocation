import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  @override
  _ShowSimpleMapState createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  GoogleMapController googleMapController;
  static LatLng _center = const LatLng(32.9313, 72.8028);

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
      ),
      body: GoogleMap(
        markers: {chakoraMarker},
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        mapType: MapType.hybrid,
      ),
    );
  }

  Marker chakoraMarker = Marker(
    position: _center,
    markerId: MarkerId("Chakora"),
    infoWindow: InfoWindow(
      title: "Chakora",
      snippet: "This is a great town",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  );
}
