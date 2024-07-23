part of 'teams_cubit.dart';

@immutable
abstract class TeamsState {}

class TeamsInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsLoaded extends TeamsState {
  final List<Team> teams;

  TeamsLoaded({required this.teams});
}

class TeamsError extends TeamsState {
  final String message;

  TeamsError({required this.message});
}
