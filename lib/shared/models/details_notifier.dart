import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:simple_bet/shared/models/linescore.dart';
import 'package:simple_bet/shared/utils/apis.dart';

class DetailsNotifier with ChangeNotifier {
  LineScore _linescore;

  LineScore get linescore => _linescore;

  List<String> homeRuns(
    String homeTeam,
    List<Inning> list,
    Away away,
  ) =>
      _homeRuns(homeTeam, list, away);

  List<String> awayRuns(
    String awayTeam,
    List<Inning> list,
    Away away,
  ) =>
      _awayRuns(awayTeam, list, away);

  void callApi(int id) async {
    try {
      _linescore = await ApiServices.instance.lineScore(id);
      notifyListeners();
    } catch (error) {
      print('Error is ${error.toString()}');
      // _linescore = null;
    }
  }

  List<String> _homeRuns(String team, List<Inning> list, Away away) {
    List<String> _runs = [];

    _runs.add(team);

    for (Inning item in list) {
      _runs.add((item.home.runs ?? '-').toString());
    }

    _runs.add((away.runs ?? '-').toString());
    _runs.add((away.hits ?? '-').toString());
    _runs.add((away.errors ?? '-').toString());

    return _runs;
  }

  List<String> _awayRuns(String team, List<Inning> list, Away away) {
    List<String> _runs = [];

    _runs.add(team);

    for (Inning item in list) {
      _runs.add((item.away.runs ?? '-').toString());
    }

    _runs.add((away.runs ?? '-').toString());
    _runs.add((away.hits ?? '-').toString());
    _runs.add((away.errors ?? '-').toString());

    return _runs;
  }
}
