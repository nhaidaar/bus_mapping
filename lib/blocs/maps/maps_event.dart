part of 'maps_bloc.dart';

sealed class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object> get props => [];
}

class MapsCurrentLocationEvent extends MapsEvent {}

class MapsGetDistanceEvent extends MapsEvent {
  final double startLatitude;
  final double startLongitude;
  final double endLatitude;
  final double endLongitude;

  const MapsGetDistanceEvent({
    required this.startLatitude,
    required this.startLongitude,
    required this.endLatitude,
    required this.endLongitude,
  });

  @override
  List<Object> get props =>
      [startLatitude, startLongitude, endLatitude, endLongitude];
}

class MapsGetAddressEvent extends MapsEvent {
  final Position position;
  const MapsGetAddressEvent(this.position);

  @override
  List<Object> get props => [position];
}
