part of 'leagues_cubit.dart';

@immutable
abstract class LeaguesState {}

class LeaguesInitial extends LeaguesState {}

class LeaguesLoading extends LeaguesState {}

class LeaguesLoaded extends LeaguesState {
  final List<League> leagues;

  LeaguesLoaded({required this.leagues});
}

class LeaguesError extends LeaguesState {
  final String message;

  LeaguesError({required this.message});
}
