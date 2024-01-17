import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/blocs/maps/maps_bloc.dart';
import 'package:maps_route/shared/api.dart';

class MapsPage extends StatefulWidget {
  final double latitude;
  final double longitude;
  const MapsPage({super.key, required this.latitude, required this.longitude});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController?> controller = Completer();
  Position? currentPosition;
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: mapsApi);

  List<LatLng>? routes;
  String distance = '0';

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  void getCurrentPosition() async {
    currentPosition = await Geolocator.getCurrentPosition();
    setState(() {});

    distance = Geolocator.distanceBetween(
      currentPosition!.latitude,
      currentPosition!.longitude,
      widget.latitude,
      widget.longitude,
    ).toStringAsFixed(0);
    setState(() {});
  }

  void getPolylinesWithLocation() async {
    List<LatLng>? routes = await googleMapPolyline.getCoordinatesWithLocation(
      origin: LatLng(
        currentPosition!.latitude,
        currentPosition!.longitude,
      ),
      destination: LatLng(
        widget.latitude,
        widget.longitude,
      ),
      mode: RouteMode.driving,
    );
    if (mounted) {
      setState(() {
        this.routes = routes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapsBloc()..add(GetCurrentLocation()),
      child: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          if (state is MapsLoaded) {
            getPolylinesWithLocation();

            return Scaffold(
              appBar: _appBar(context),
              extendBodyBehindAppBar: true,
              body: GoogleMap(
                onMapCreated: (mapController) {
                  controller.complete(mapController);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentPosition!.latitude,
                    currentPosition!.longitude,
                  ),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('Destination'),
                    position: LatLng(
                      widget.latitude,
                      widget.longitude,
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
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      leadingWidth: 68,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 28,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(41),
        ),
        child: FittedBox(
          child: Text(
            '$distance m lagi',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
