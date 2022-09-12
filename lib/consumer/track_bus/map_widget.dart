import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
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
    getCurrentLocation();
    setCustomMarkerIcon();
    if(currentLocation != null){
      setState(() {
        
      });
    }
    super.initState();
  }
  static const LatLng sourceLocation = LatLng(24.8996, 91.9038);
  static const LatLng destination = LatLng(24.8694, 91.8049);
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition cameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: 50,
  );
  List<LatLng> polylineCoordinates = [
    sourceLocation,const LatLng(24.9059, 91.8721),const LatLng(24.907143, 91.860808),const LatLng(24.9111, 91.8322),const LatLng(24.9121, 91.8232),LatLng(24.874133704237412, 91.80662891337683),destination
  ];

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "https://maps.googleapis.com/maps/api/js?key=AIzaSyDLJS3Rg9wi2HG2Zp_6aItd5gxVYho89Qw", 
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
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


  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {
          currentLocation = newLoc;
        });
      },
    );
  }


  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/bus_icon.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Pin_destination.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "asset/images/bus_icon.png")
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leading - Tilagor'),
        actions: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Estimated Time'),
                Text('30 minutes')
              ],
            ),
          )
        ],
      ),
      body:(currentLocation == null) 
      ? const Center(child: Text("Loading"))
      : GoogleMap(
        mapType: MapType.normal,
        onMapCreated: ((GoogleMapController controller){
          _controller.complete(controller);
        }),
        initialCameraPosition: CameraPosition(
          target: LatLng(
              currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 50,
        ),
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
          )
        },
        trafficEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          Marker(
            visible: true,
            icon: currentLocationIcon,
            markerId: const MarkerId("currentLocation"),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
          const  Marker(
            markerId: MarkerId("source"),
            position:  sourceLocation,
          ),
           const Marker(
            markerId: MarkerId("mosque"),
            position: LatLng(24.874133704237412, 91.80662891337683),
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        
      ),
    );

  }
}