import 'package:http/http.dart' as http;
import 'package:simple_bet/shared/models/batters_pitchers.dart';
import 'package:simple_bet/shared/models/linescore.dart';
import 'package:simple_bet/shared/models/player_stats.dart';
import 'package:simple_bet/shared/models/scores.dart';
import 'package:simple_bet/shared/utils/constants.dart';

class ApiServices {
  ApiServices._privateConstructor();

  /// GENERIC INSTANCE OF ApiServices CLASS.....
  static final instance = ApiServices._privateConstructor();

  /// Internal Instances...
  _InternalLogic _instance = _InternalLogic();

  /// Call Scores Api...
  Future<Scores> get fetchScores => _instance._fetchScores();

  /// Call LineScore Api...
  Future<LineScore> lineScore(int id) => _instance._fetchLineScore(id);

  /// Call BattersPitchers Api...
  Future<BattersAndPichers> battersPitchers(int id) =>
      _instance._battersPitchers(
        id,
      );

  /// Call PlayerStats Api...
  Future<PlayerStats> playerStats(int id) => _instance._playerStats(id);
}

class _InternalLogic {
  _InternalLogic();

  Future<Scores> _fetchScores() async {
    final _response = await http.get(UrlConstants.kScoresAPI);

    if (_response.statusCode == 200) {
      // ON SUCCESS
      final _score = scoresFromJson(_response.body);

      return _score;
    } else {
      // If that call was not successful, throw an error.
      return null;
    }
  }

  Future<LineScore> _fetchLineScore(int id) async {
    final _response = await http.get(
      '${UrlConstants.kGenericAPI}$id/linescore',
    );

    if (_response.statusCode == 200) {
      // ON SUCCESS
      final _linescore = lineScoreFromJson(_response.body);

      return _linescore;
    } else {
      // If that call was not successful, throw an error.
      return null;
    }
  }

  Future<BattersAndPichers> _battersPitchers(int id) async {
    final _response = await http.get(
      '${UrlConstants.kBattersPitchersAPIPartOne}$id/${UrlConstants.kBattersPitchersAPIPartTwo}',
    );

    if (_response.statusCode == 200) {
      // ON SUCCESS
      final _battersPitchers = battersAndPichersFromJson(_response.body);

      return _battersPitchers;
    } else {
      // If that call was not successful, throw an error.
      return null;
    }
  }

  Future<PlayerStats> _playerStats(int id) async {
    final _response = await http.get(
      '${UrlConstants.kGenericAPI}$id/${UrlConstants.kPlayerStatsAPIPartTwo}',
    );

    if (_response.statusCode == 200) {
      // ON SUCCESS
      final _playerStats = playerStatsFromJson(_response.body);

      return _playerStats;
    } else {
      // If that call was not successful, throw an error.
      return null;
    }
  }
}
