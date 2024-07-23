// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repository.dart';
import '../../data/models/team.dart';

part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  final Repository repository;

  TeamsCubit(this.repository) : super(TeamsInitial());

  void fetchTeams(int leagueId) async {
    try {
      emit(TeamsLoading());
      final teams = await repository.fetchTeams(leagueId);
      emit(TeamsLoaded(teams: teams));
    } catch (e) {
      emit(TeamsError(message: e.toString()));
    }
  }
}
