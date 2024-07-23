import 'package:flutter/material.dart';

class LeagueDetailScreen extends StatelessWidget {
  final String leagueName;
  final String seasonYear;
  final List<Map<String, dynamic>> standings;
  final List<Map<String, dynamic>> recentResults;
  final List<Map<String, dynamic>> upcomingMatches;

  const LeagueDetailScreen({
    super.key,
    required this.leagueName,
    required this.seasonYear,
    required this.standings,
    required this.recentResults,
    required this.upcomingMatches,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('League Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const PromotionalBanner(
                text: "Get the Latest League Updates and Standings!",
              ),
              const SizedBox(height: 16.0),
              Text(
                'League Name: $leagueName',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Current Season: $seasonYear',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Standings:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var team in standings)
                ListTile(
                  title: Text(team['team']),
                  trailing: Text(team['points'].toString()),
                ),
              const SizedBox(height: 16.0),
              const Text(
                'Recent Results:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var result in recentResults)
                ListTile(
                  title: Text(
                      '${result['teamA']} ${result['score']} ${result['teamB']}'),
                ),
              const SizedBox(height: 16.0),
              const Text(
                'Upcoming Matches:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var match in upcomingMatches)
                ListTile(
                  title: Text('${match['teamA']} vs ${match['teamB']}'),
                  subtitle: Text(match['date']),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromotionalBanner extends StatelessWidget {
  final String text;

  const PromotionalBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
