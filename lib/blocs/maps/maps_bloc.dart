import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../services/maps_service.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsInitial()) {
    on<MapsCurrentLocationEvent>((event, emit) async {
      emit(MapsLoading());
      try {
        await MapsService().getUserCurrentPosition().then((position) {
          emit(MapsLoaded(position));
        });
      } catch (e) {
        MapsError(e.toString());
      }
    });
    on<MapsGetDistanceEvent>((event, emit) async {
      emit(MapsLoading());
      try {
        await MapsService()
            .getDistance(
          startLatitude: event.startLatitude,
          startLongitude: event.startLongitude,
          endLatitude: event.endLatitude,
          endLongitude: event.endLongitude,
        )
            .then((distance) {
          emit(DistanceSuccess(distance));
        });
      } catch (e) {
        MapsError(e.toString());
      }
    });

    on<MapsGetAddressEvent>((event, emit) async {
      emit(MapsLoading());
      try {
        await MapsService()
            .getShortAddressFromPosition(event.position)
            .then((address) {
          emit(AddressSuccess(address));
        });
      } catch (e) {
        MapsError(e.toString());
      }
    });
  }
}
