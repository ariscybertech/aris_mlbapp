import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:simple_bet/shared/models/scores.dart';
import 'package:simple_bet/shared/utils/apis.dart';

class ScoresNotifier with ChangeNotifier {
  Scores _scores;

  Scores get scores => _scores;

  /// Calls the API
  void callApi() async {
    _scores = await ApiServices.instance.fetchScores;
    notifyListeners();
  }
}
