import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/services/maps_service.dart';
import 'package:maps_route/shared/value.dart';
import 'package:maps_route/widgets/custom_field.dart';

import '../shared/theme.dart';

class Maps extends StatefulWidget {
  final LatLng destination;
  final String locationName;
  final String topsis;
  const Maps(
      {super.key,
      required this.destination,
      required this.topsis,
      required this.locationName});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController?> controller = Completer();
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: mapsApi);
  List<LatLng>? routes;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MapsService().getUserCurrentPosition(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Get the route
          getPolylinesWithLocation(
            LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
          );

          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.locationName,
                style: boldTS,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Clip the map with radius
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: getMaps(snapshot),
                    ),
                  ),

                  // Information Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jarak : ',
                              style: mediumTS.copyWith(fontSize: 15),
                            ),
                            const Gap(10),
                            Expanded(
                              child: CustomField(
                                child: getDistance(snapshot),
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dijkstra : ',
                              style: mediumTS.copyWith(fontSize: 15),
                            ),
                            const Gap(10),
                            Expanded(
                              child: CustomField(
                                child: getDistance(snapshot),
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Topsis : ',
                              style: mediumTS.copyWith(fontSize: 15),
                            ),
                            const Gap(10),
                            Expanded(
                              child: CustomField(
                                child: Text(
                                  widget.topsis,
                                  style: mediumTS,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // If maps is loading and error
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
    );
  }

  GoogleMap getMaps(AsyncSnapshot<Position> snapshot) {
    return GoogleMap(
      onMapCreated: (mapController) {
        controller.complete(mapController);
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(
          snapshot.data!.latitude,
          snapshot.data!.longitude,
        ),
        zoom: 17,
      ),
      mapType: MapType.terrain,
      markers: {
        Marker(
          markerId: const MarkerId('Our Location'),
          position: LatLng(
            snapshot.data!.latitude,
            snapshot.data!.longitude,
          ),
        ),
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
    );
  }

  FutureBuilder<double> getDistance(AsyncSnapshot<Position> snapshot) {
    return FutureBuilder(
      future: MapsService().getDistance(
        startLatitude: snapshot.data!.latitude,
        startLongitude: snapshot.data!.longitude,
        endLatitude: widget.destination.latitude,
        endLongitude: widget.destination.longitude,
      ),
      builder: (context, distance) {
        if (distance.hasData) {
          return Text(
            '${distance.data!.toStringAsFixed(1)} m',
            style: mediumTS,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          );
        }
        return const Text('-');
      },
    );
  }

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
