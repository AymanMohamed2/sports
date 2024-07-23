// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repository.dart';
import '../../data/models/league.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  final Repository repository;

  LeaguesCubit(this.repository) : super(LeaguesInitial());

  void fetchLeagues(int countryId) async {
    try {
      emit(LeaguesLoading());
      final leagues = await repository.fetchLeagues(countryId);
      emit(LeaguesLoaded(leagues: leagues));
    } catch (e) {
      emit(LeaguesError(message: e.toString()));
    }
  }
}
