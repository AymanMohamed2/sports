import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/data/models/country.dart';
import 'package:sports/data/repository.dart';
import 'package:sports/presentation/cubit/country_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final Repository repository;
  int? selectedCountryId;
  CountriesCubit(this.repository) : super(CountriesInitial());
  List<Country>? countries;

  void fetchCountries() async {
    try {
      emit(CountriesLoading());
      final countries = await repository.fetchCountries();
      this.countries = countries;
      emit(CountriesLoaded(countries: countries));
    } catch (e) {
      print(e.toString());
      emit(CountriesError(message: e.toString()));
    }
  }
}
