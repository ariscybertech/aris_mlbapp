import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutter/foundation.dart' show ChangeNotifier;

class ButtonSelector with ChangeNotifier {
  List<bool> _optionSelected = [true, false];

  /// Get final option selected;
  List<bool> get optionSelected => _optionSelected;

  /// Background color for the button...
  Color backgroundColor(bool isSelected) => _backgroundColor(isSelected);

  /// Text color for the button...
  Color textColor(bool isSelected) => _buttonTextColor(isSelected);

  void addSelectedOption(int index) {
    final int _matchedIndex = _optionSelected.indexOf(true);

    // If there is a true value present before, change to false....
    if (_matchedIndex != -1) {
      _optionSelected[_matchedIndex] = false;
    }

    _optionSelected[index] = true;
    notifyListeners();
  }

  Color _backgroundColor(bool status) {
    Color color = Color(0x149e9e9e);

    if (status) {
      color = Colors.black;
    }

    return color;
  }

  Color _buttonTextColor(bool status) {
    Color color = Colors.black;

    if (status) {
      color = Colors.white;
    }

    return color;
  }
}
