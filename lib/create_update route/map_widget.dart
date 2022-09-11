import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition cameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: 13.5,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: destination,
  );
  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'https://maps.googleapis.com/maps/api/js?key=AIzaSyBKiqfIXibtQGMkgNP3vmJaDXAHn-1aV7U', 
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
      PointLatLng(destination.latitude, destination.longitude)
    );

    if(result.points.isNotEmpty){
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)
        );
      }
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
            width: 6
          )
        },
        mapType: MapType.normal,
        myLocationEnabled: true,
         markers: {
          const Marker(
            markerId: MarkerId("source"),
            position:  LatLng(37.33500926, -122.03272188),
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: LatLng(37.33429383, -122.06600055),
          ),
        },
        onMapCreated: ((GoogleMapController controller){
          _controller.complete(controller);
        })
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );

  }
   Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}