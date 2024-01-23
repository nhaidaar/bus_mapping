part of 'maps_bloc.dart';

sealed class MapsState extends Equatable {
  const MapsState();

  @override
  List<Object> get props => [];
}

final class MapsInitial extends MapsState {}

final class MapsLoading extends MapsState {}

final class MapsLoaded extends MapsState {
  final Position position;
  const MapsLoaded(this.position);

  @override
  List<Object> get props => [position];
}

final class MapsError extends MapsState {
  final String e;
  const MapsError(this.e);

  @override
  List<Object> get props => [e];
}

final class DistanceSuccess extends MapsState {
  final double distance;
  const DistanceSuccess(this.distance);

  @override
  List<Object> get props => [distance];
}

final class AddressSuccess extends MapsState {
  final String address;
  const AddressSuccess(this.address);

  @override
  List<Object> get props => [address];
}
