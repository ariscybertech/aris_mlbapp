import 'package:flutter/material.dart' show MediaQuery;

class ScreenQueries {
  ScreenQueries._privateConstructor();

  /// GENERIC INSTANCE OF ScreenQueries CLASS.....
  static final instance = ScreenQueries._privateConstructor();

  double width(context) => MediaQuery.of(context).size.width;

  double height(context) => MediaQuery.of(context).size.height;
}
