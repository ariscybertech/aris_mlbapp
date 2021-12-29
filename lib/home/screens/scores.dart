import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_bet/details/screens/match_details.dart';
import 'package:simple_bet/shared/models/custom_details.dart';

import 'package:simple_bet/shared/models/score_notifier.dart';
import 'package:simple_bet/shared/utils/screen_size.dart';
import 'package:simple_bet/shared/utils/teams_abbr.dart';
import 'package:simple_bet/shared/widgets/score_card.dart';

class ScoresScreen extends StatelessWidget {
  /// Show the Scores screen....
  const ScoresScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    final _height = ScreenQueries.instance.height(context);
    final _width = ScreenQueries.instance.width(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 26.0,
      ),
      child: Consumer<ScoresNotifier>(
        builder: (_, model, __) {
          //

          if (model.scores == null) return CircularProgressIndicator();

          final scores = model.scores;

          return ListView.separated(
            itemCount: scores.totalItems,
            itemBuilder: (context, index) {
              //
              final _game = scores.dates.first.games[index];
              final _homeTeamDetails = _game.teams.home.team.name;
              final _awayTeamDetails = _game.teams.away.team.name;

              final String _state = _game.status.toJson()['abstractGameState'];

              final _homeTeam = TeamShortName.instance.shortName(
                _homeTeamDetails,
              );

              final _awayTeam = TeamShortName.instance.shortName(
                _awayTeamDetails,
              );

              final _homeTeamLogoPath = TeamShortName.instance.teamLogoPath(
                _homeTeamDetails,
              );

              final _awayTeamLogoPath = TeamShortName.instance.teamLogoPath(
                _awayTeamDetails,
              );

              return GestureDetector(
                child: ScoreCard(
                  game: _game,
                  homeTeamLogoPath: _homeTeamLogoPath,
                  awayTeamLogoPath: _awayTeamLogoPath,
                  height: _height,
                  width: _width,
                  homeTeam: _homeTeam,
                  state: _state,
                  awayTeam: _awayTeam,
                ),
                onTap: () async {
                  //

                  final _detailsRoute = MaterialPageRoute(
                    builder: (_) => Provider<CustomDetails>.value(
                      value: CustomDetails(
                        awayTeamAbbr: _awayTeam,
                        awayTeamLogoPath: _awayTeamLogoPath,
                        homeTeamAbbr: _homeTeam,
                        homeTeamLogoPath: _homeTeamLogoPath,
                        game: _game,
                        matchState: _state,
                      ),
                      child: MatchDetails(),
                    ),
                  );
                  //
                  await Navigator.of(context).push(_detailsRoute);
                },
              );
            },
            separatorBuilder: (context, index) => const Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          );
        },
      ),
    );
  }
}
