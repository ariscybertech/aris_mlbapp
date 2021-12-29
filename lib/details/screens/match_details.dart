import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_bet/details/screens/ui/stats.dart';
import 'package:simple_bet/shared/models/batters_pitchers_notifier.dart';
import 'package:simple_bet/shared/models/button_selector.dart';
import 'package:simple_bet/shared/models/custom_details.dart';
import 'package:simple_bet/shared/models/details_notifier.dart';
import 'package:simple_bet/shared/utils/screen_size.dart';
import 'package:simple_bet/shared/widgets/score_card.dart';
import 'package:simple_bet/shared/widgets/score_table.dart';
import 'package:simple_bet/shared/widgets/team_toggler.dart';

class MatchDetails extends StatelessWidget {
  /// Match Details for the selected match..
  const MatchDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Consumer<CustomDetails>(
      builder: (context, customDetails, _) {
        //

        final _id = customDetails.game.gamePk;
        final _homeTeamDetails = customDetails.homeTeamAbbr;
        final _awayTeamDetails = customDetails.awayTeamAbbr;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('$_homeTeamDetails - $_awayTeamDetails'),
          ),
          body: SafeArea(
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<DetailsNotifier>(
                  create: (_) => DetailsNotifier()..callApi(_id),
                ),
                ChangeNotifierProvider<BattersPitchersNotifier>(
                  create: (_) => BattersPitchersNotifier()..callApi(_id),
                ),
              ],
              child: _InternalWidget(),
            ),
          ),
        );
      },
    );
  }
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 18.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ScoreCard(),
          const SizedBox(height: 30.0),
          Consumer2<DetailsNotifier, CustomDetails>(
            builder: (context, linescore, customDetails, _) {
              //
              final _model = linescore.linescore;
              final _instance = DetailsNotifier();

              if (_model == null) return CircularProgressIndicator();

              final _homeInnings = _instance.homeRuns(
                customDetails.homeTeamAbbr,
                _model.innings,
                _model.teams.home,
              );

              final _awayInnings = _instance.awayRuns(
                customDetails.awayTeamAbbr,
                _model.innings,
                _model.teams.away,
              );

              return ScoreTable(
                homeInnings: _homeInnings,
                awayInnings: _awayInnings,
              );
            },
          ),
          //

          const SizedBox(height: 50.0),
          ChangeNotifierProvider<ButtonSelector>(
            create: (_) => ButtonSelector(),
            child: Consumer2<ButtonSelector, CustomDetails>(
              builder: (_, buttonSelector, customDetails, __) {
                //
                final _model = buttonSelector;
                final _bgColor = _model.backgroundColor;
                final _textColor = _model.textColor;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ChipWidget(
                      homeTeam: customDetails.homeTeamAbbr,
                      homeTeamPressed: () => _model.addSelectedOption(0),
                      colorOne: _bgColor(_model.optionSelected[0]),
                      colorTwo: _bgColor(_model.optionSelected[1]),
                      awayTeam: customDetails.awayTeamAbbr,
                      awayTeamPressed: () => _model.addSelectedOption(1),
                      textColorOne: _textColor(_model.optionSelected[0]),
                      textColorTwo: _textColor(_model.optionSelected[1]),
                    ),
                    const SizedBox(height: 30.0),
                    if (_model.optionSelected.first)
                      StatsSection()
                    else
                      StatsSection(showHome: false)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _height = ScreenQueries.instance.height(context);
    final _width = ScreenQueries.instance.width(context);

    return Consumer<CustomDetails>(
      builder: (context, customDetails, _) {
        //
        final _game = customDetails.game;

        return ScoreCard(
          game: _game,
          homeTeamLogoPath: customDetails.homeTeamLogoPath,
          awayTeamLogoPath: customDetails.awayTeamLogoPath,
          homeTeam: customDetails.homeTeamAbbr,
          height: _height,
          width: _width,
          state: customDetails.matchState,
          awayTeam: customDetails.awayTeamAbbr,
          showBorder: false,
        );
      },
    );
  }
}
