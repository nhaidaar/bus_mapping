import 'package:geocoding/geocoding.dart';
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

  Future<String> getFullAddressFromPosition(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String street = placemark.street ?? '';
        String subLocality = placemark.subLocality ?? '';
        String locality = placemark.locality ?? '';
        String administrativeArea = placemark.subAdministrativeArea ?? '';
        String postalCode = placemark.postalCode ?? '';

        // Construct the full address
        String fullAddress =
            '$street, $subLocality, $locality, $administrativeArea $postalCode';
        return fullAddress;
      } else {
        return 'Address not found';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<String> getShortAddressFromPosition(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        return placemarks[0].street ?? '';
      } else {
        return 'Address not found';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
