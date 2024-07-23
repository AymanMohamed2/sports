import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:location_service_with_permission/exeptions.dart';
import 'package:meta/meta.dart';
import 'package:sports/data/repository.dart';

part 'get_location_state.dart';

class GetLocationCubitCubit extends Cubit<GetLocationCubitState> {
  GetLocationCubitCubit(this.repository) : super(GetLocationCubitInitial());
  final Repository repository;
  Future<void> getLocation() async {
    try {
      emit(GetLocationCubitLoading());
      LocationData locationData = await repository.fetchLocationData();

      String country = await getCountryFromLatLng(
          locationData.latitude!, locationData.longitude!);
      emit(GetLocationCubitSuccess(country));
    } on LocationServiceDisabledException catch (e) {
      emit(GetLocationCubitFailure(e.toString()));
    } on CheckAndRequestLocationPermessionExeption catch (e) {
      emit(GetLocationCubitFailure(e.toString()));
    } catch (e) {
      emit(GetLocationCubitFailure(e.toString()));
    }
  }

  Future<String> getCountryFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks.first;
      print(place.country);
      return place.country ?? '';
    } catch (e) {
      print('Error: $e');
      return '';
    }
  }
}
