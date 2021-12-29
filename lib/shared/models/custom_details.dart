import 'package:simple_bet/shared/models/scores.dart';

class CustomDetails {
  CustomDetails({
    this.awayTeamAbbr,
    this.homeTeamAbbr,
    this.homeTeamLogoPath,
    this.awayTeamLogoPath,
    this.game,
    this.matchState,
  });

  final String homeTeamAbbr;

  final String homeTeamLogoPath;

  final String awayTeamAbbr;

  final String awayTeamLogoPath;

  final Game game;

  final String matchState;
}
