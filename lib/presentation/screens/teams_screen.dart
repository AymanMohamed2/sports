import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/teams_cubit.dart';

class TeamsScreen extends StatelessWidget {
  final int leagueId;

  const TeamsScreen({super.key, required this.leagueId});

  @override
  Widget build(BuildContext context) {
    context.read<TeamsCubit>().fetchTeams(leagueId);

    return Scaffold(
      appBar: AppBar(title: const Text('Teams')),
      body: BlocBuilder<TeamsCubit, TeamsState>(
        builder: (context, state) {
          if (state is TeamsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TeamsLoaded) {
            return ListView.builder(
              itemCount: state.teams.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.teams[index].name),
                  onTap: () {
                    Navigator.pushNamed(context, '/players',
                        arguments: state.teams[index].id);
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Failed to load teams'));
          }
        },
      ),
    );
  }
}
