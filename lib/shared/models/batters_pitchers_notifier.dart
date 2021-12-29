import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:simple_bet/shared/models/batters_pitchers.dart';
import 'package:simple_bet/shared/utils/apis.dart';

class BattersPitchersNotifier with ChangeNotifier {
  BattersAndPichers _battersPitchers;

  BattersAndPichers get battersPitchers => _battersPitchers;

  void callApi(int id) async {
    try {
      _battersPitchers = await ApiServices.instance.battersPitchers(id);
      notifyListeners();
    } catch (error) {
      print('Error is ${error.toString()}');
    }
  }
}
