// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import '../../data/repository.dart';
// import '../../data/models/player.dart';

// part 'players_state.dart';

// class PlayersCubit extends Cubit<PlayersState> {
//   final Repository repository;

//   PlayersCubit(this.repository) : super(PlayersInitial());

//   void fetchPlayers(int teamId) async {
//     try {
//       emit(PlayersLoading());
//       final players = await repository.getPlayers(teamId);
//       emit(PlayersLoaded(players: players));
//     } catch (e) {
//       emit(PlayersError(message: e.toString()));
//     }
//   }
// }

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repository.dart';
import '../../data/models/player.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  final Repository repository;

  PlayersCubit(this.repository) : super(PlayersInitial());

  void fetchPlayers(int teamId) async {
    try {
      emit(PlayersLoading());
      final players = await repository.fetchPlayers(teamId);
      emit(PlayersLoaded(players: players));
    } catch (e) {
      emit(PlayersError(message: e.toString()));
    }
  }
}
