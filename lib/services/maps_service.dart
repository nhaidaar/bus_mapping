import 'package:geolocator/geolocator.dart';

class MapsService {
  Future<Position> getUserCurrentPosition() async {
    await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition();
  }

  Future<double> getDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) async {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }
}
