import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/services/maps_service.dart';
import 'package:maps_route/shared/value.dart';
import 'package:maps_route/widgets/back_button.dart';
import 'package:maps_route/widgets/distance_meter.dart';

class Maps extends StatefulWidget {
  final LatLng destination;
  const Maps({super.key, required this.destination});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController?> controller = Completer();
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: mapsApi);
  List<LatLng>? routes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: MapsService().getUserCurrentPosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Get the route
            getPolylinesWithLocation(
              LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
            );

            return Scaffold(
              // Appbar with Distance-meter
              appBar: _appBar(
                user: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                destination: widget.destination,
              ),
              extendBodyBehindAppBar: true,
              body: GoogleMap(
                onMapCreated: (mapController) {
                  controller.complete(mapController);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    snapshot.data!.latitude,
                    snapshot.data!.longitude,
                  ),
                  zoom: 16,
                ),
                mapType: MapType.terrain,
                markers: {
                  Marker(
                    markerId: const MarkerId('Destination'),
                    position: LatLng(
                      widget.destination.latitude,
                      widget.destination.longitude,
                    ),
                  ),
                },
                polylines: {
                  Polyline(
                    width: 4,
                    polylineId: const PolylineId('Route'),
                    color: Colors.blue,
                    points: routes ?? [],
                  ),
                },
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: Text(
                'Sedang memuat peta,\ntunggu sebentar ya...',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar({
    required LatLng user,
    required LatLng destination,
  }) =>
      AppBar(
        toolbarHeight: 72,
        leadingWidth: 68,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CustomBackButton(),
        ),
        title: DistanceMeter(
          start: user,
          end: destination,
        ),
        centerTitle: true,
        elevation: 0,
      );

  void getPolylinesWithLocation(LatLng user) async {
    List<LatLng>? routes = await googleMapPolyline.getCoordinatesWithLocation(
      origin: user,
      destination: LatLng(
        widget.destination.latitude,
        widget.destination.longitude,
      ),
      mode: RouteMode.driving,
    );
    if (mounted) {
      setState(() {
        this.routes = routes;
      });
    }
  }
}
