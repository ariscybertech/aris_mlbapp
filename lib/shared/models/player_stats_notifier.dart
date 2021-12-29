import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:simple_bet/shared/models/player_stats.dart';
import 'package:simple_bet/shared/utils/apis.dart';

class PlayerStatsNotifier with ChangeNotifier {
  PlayerStats _playerStats;

  PlayerStats get playerStats => _playerStats;

  void callApi(int id) async {
    try {
      _playerStats = await ApiServices.instance.playerStats(id);
      notifyListeners();
    } catch (error) {
      print('Error is ${error.toString()}');
    }
  }
}
