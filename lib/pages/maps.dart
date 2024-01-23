import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blocs/maps/maps_bloc.dart';
import '../shared/theme.dart';
import '../shared/value.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class Maps extends StatefulWidget {
  final LatLng destination;
  final String locationName;
  final String topsis;
  const Maps({
    super.key,
    required this.destination,
    required this.topsis,
    required this.locationName,
  });

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController?> controller = Completer();
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: mapsApi);
  List<LatLng>? routes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsBloc()..add(MapsCurrentLocationEvent()),
      child: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          if (state is MapsLoaded) {
            // Get the route
            getPolylinesWithLocation(
              LatLng(state.position.latitude, state.position.longitude),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Clip the map with radius
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: getMaps(state),
                      ),
                    ),

                    // Navigate to Google Maps App
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                        text: 'Get Route',
                        onTap: () async {
                          await launchUrl(
                            Uri.parse(
                                'google.navigation:q=${widget.destination.latitude}, ${widget.destination.longitude}&key=$mapsApi'),
                          );
                        },
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
                                  child: getDistance(state),
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
                                  child: getDistance(state),
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
      ),
    );
  }

  GoogleMap getMaps(MapsLoaded state) {
    return GoogleMap(
      onMapCreated: (mapController) {
        controller.complete(mapController);
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(
          state.position.latitude,
          state.position.longitude,
        ),
        zoom: 17,
      ),
      mapType: MapType.terrain,
      markers: {
        Marker(
          markerId: const MarkerId('Our Location'),
          position: LatLng(
            state.position.latitude,
            state.position.longitude,
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

  BlocProvider<MapsBloc> getDistance(MapsLoaded state) {
    return BlocProvider(
      create: (context) => MapsBloc()
        ..add(
          MapsGetDistanceEvent(
            startLatitude: state.position.latitude,
            startLongitude: state.position.longitude,
            endLatitude: widget.destination.latitude,
            endLongitude: widget.destination.longitude,
          ),
        ),
      child: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          if (state is DistanceSuccess) {
            return Text(
              '${state.distance.toStringAsFixed(1)} m',
              style: mediumTS,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            );
          }
          return const Text('-');
        },
      ),
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
