import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_bet/home/screens/scores.dart';
import 'package:simple_bet/shared/models/score_notifier.dart';
import 'package:simple_bet/shared/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: const Text(SimpleBetConstants.kAppTitle),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: ChangeNotifierProvider<ScoresNotifier>(
            create: (_) => ScoresNotifier()..callApi(),
            child: ScoresScreen(),
          ),
        ),
      ),
    );
  }
}
