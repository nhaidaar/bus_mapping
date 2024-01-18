import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_route/services/maps_service.dart';

class DistanceMeter extends StatelessWidget {
  final LatLng start;
  final LatLng end;
  const DistanceMeter({
    super.key,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: FutureBuilder(
          future: MapsService().getDistance(
            startLatitude: start.latitude,
            startLongitude: start.longitude,
            endLatitude: end.latitude,
            endLongitude: end.longitude,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final distance = snapshot.data!.toStringAsFixed(0);
              return Text(
                '$distance m lagi',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                ),
              );
            }
            return const Text('-');
          },
        ),
      ),
    );
  }
}
