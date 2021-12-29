import 'package:flutter/material.dart';
import 'package:simple_bet/shared/models/scores.dart';
import 'package:simple_bet/shared/utils/constants.dart';

class ScoreCard extends StatelessWidget {
  /// Creates the Score Card for the game.....
  const ScoreCard({
    Key key,
    @required Game game,
    @required String homeTeamLogoPath,
    @required String awayTeamLogoPath,
    double height = 120.0,
    double width = 120.0,
    String homeTeam = 'WSH',
    String state = 'Final',
    String awayTeam = 'CLE',
    this.showBorder = true,
  })  : _game = game,
        _homeTeamLogoPath = homeTeamLogoPath,
        _awayTeamLogoPath = awayTeamLogoPath,
        _height = height,
        _width = width,
        _homeTeam = homeTeam,
        _state = state,
        _awayTeam = awayTeam,
        super(key: key);

  final Game _game;

  final String _homeTeamLogoPath;

  final String _awayTeamLogoPath;

  final double _height;

  final double _width;

  final String _homeTeam;

  final String _state;

  final String _awayTeam;

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      decoration: showBorder
          ? BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.6),
            )
          : null,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TeamWidget(
            teamImagePath: _homeTeamLogoPath,
            height: _height,
            width: _width,
            team: _homeTeam,
          ),
          _ScoreWidget(score: _game.teams.home.score.toString()),
          Text(
            '$_state',
            style: Theme.of(context).textTheme.title.copyWith(
                letterSpacing: 1.2, color: Colors.black54, fontSize: 16.0),
          ),
          _ScoreWidget(score: _game.teams.away.score.toString()),
          _TeamWidget(
            teamImagePath: _awayTeamLogoPath,
            height: _height,
            width: _width,
            team: _awayTeam,
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key key, @required String score})
      : _score = score,
        super(key: key);

  final String _score;

  @override
  Widget build(BuildContext context) {
    //

    return Text(
      '$_score',
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class _TeamWidget extends StatelessWidget {
  const _TeamWidget({
    Key key,
    @required String teamImagePath,
    @required double height,
    @required double width,
    @required String team,
  })  : _teamImagePath = teamImagePath,
        _height = height,
        _width = width,
        _team = team,
        super(key: key);

  final String _teamImagePath;
  final double _height;
  final double _width;
  final String _team;

  @override
  Widget build(BuildContext context) {
    //

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          '${SimpleBetConstants.kAssetsUrl}$_teamImagePath.png',
          fit: BoxFit.contain,
          height: _height * 0.07,
          width: _width * 0.1,
        ),
        Text(
          '$_team',
          style: Theme.of(context).textTheme.title.copyWith(
              fontSize: 17.0, color: Colors.black87, letterSpacing: 0.6),
        ),
      ],
    );
  }
}
