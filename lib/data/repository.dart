import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:location_service_with_permission/location_service.dart';
import 'models/country.dart';
import 'models/league.dart';
import 'models/team.dart';
import 'models/player.dart';

class Repository {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://apiv2.allsportsapi.com/football/'));
  final String apiKey =
      '273261390740d5254a31cfa918ff4ffcfdb4398bdb7424be989f7ce507e03322';
  // https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=273261390740d5254a31cfa918ff4ffcfdb4398bdb7424be989f7ce507e03322

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await _dio.get(
          'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=273261390740d5254a31cfa918ff4ffcfdb4398bdb7424be989f7ce507e03322');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((json) => Country.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load countries: $e');
    }
  }

  Future<List<League>> fetchLeagues(int countryId) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'met': 'Leagues',
        'countryId': countryId,
        'APIkey': apiKey,
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((json) => League.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load leagues');
      }
    } catch (e) {
      throw Exception('Failed to load leagues: $e');
    }
  }

  Future<List<Team>> fetchTeams(int leagueId) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'met': 'Teams',
        'leagueId': leagueId,
        'APIkey': apiKey,
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((json) => Team.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load teams');
      }
    } catch (e) {
      throw Exception('Failed to load teams: $e');
    }
  }

  Future<List<Player>> fetchPlayers(int teamId) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'met': 'Players',
        'teamId': teamId,
        'APIkey': apiKey,
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['result'];
        return data.map((json) => Player.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load players');
      }
    } catch (e) {
      throw Exception('Failed to load players: $e');
    }
  }

  Future<LocationData> fetchLocationData() async {
    LocationService locationService = LocationService();
    var result = await locationService.getLocationData();
    return result;
  }
}
