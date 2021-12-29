import 'package:simple_bet/shared/utils/constants.dart';

class TeamShortName {
  TeamShortName._privateConstructor();

  /// GENERIC INSTANCE OF TeamShortName CLASS.....
  static final instance = TeamShortName._privateConstructor();

  /// Abbreviated names of the team....
  String shortName(String fullName) => _shortName(fullName);

  /// Team Logo Path...
  String teamLogoPath(String fullName) => _teamLogoPath(fullName);

  String _teamLogoPath(String name) {
    return name.replaceAll(RegExp(r"\s+\b|\b\s"), '_');
  }

  String _shortName(String fullName) {
    String _abbrName = '???';

    switch (fullName) {
      case MLBTeams.ArizonaDiamondbacks:
        _abbrName = MLBTeamAbbr.ArizonaDiamondbacks;
        break;

      case MLBTeams.BostonRedSox:
        _abbrName = MLBTeamAbbr.BostonRedSox;
        break;

      case MLBTeams.ChicagoWhiteSox:
        _abbrName = MLBTeamAbbr.ChicagoWhiteSox;
        break;

      case MLBTeams.ColoradoRockies:
        _abbrName = MLBTeamAbbr.ColoradoRockies;
        break;

      case MLBTeams.KansasCityRoyals:
        _abbrName = MLBTeamAbbr.KansasCityRoyals;
        break;

      case MLBTeams.LosAngelesAngels:
        _abbrName = MLBTeamAbbr.LosAngelesAngels;
        break;

      case MLBTeams.NewYorkMets:
        _abbrName = MLBTeamAbbr.NewYorkMets;
        break;

      case MLBTeams.PhiladelphiaPhillies:
        _abbrName = MLBTeamAbbr.PhiladelphiaPhillies;
        break;

      case MLBTeams.PittsburghPirates:
        _abbrName = MLBTeamAbbr.PittsburghPirates;
        break;

      case MLBTeams.SanFranciscoGiants:
        _abbrName = MLBTeamAbbr.SanFranciscoGiants;
        break;

      case MLBTeams.SeattleMariners:
        _abbrName = MLBTeamAbbr.SeattleMariners;
        break;

      case MLBTeams.StLouisCardinals:
        _abbrName = MLBTeamAbbr.StLouisCardinals;
        break;

      case MLBTeams.TexasRangers:
        _abbrName = MLBTeamAbbr.TexasRangers;
        break;

      case MLBTeams.TorontoBlueJays:
        _abbrName = MLBTeamAbbr.TorontoBlueJays;
        break;

      case MLBTeams.WashingtonNationals:
        _abbrName = MLBTeamAbbr.WashingtonNationals;
        break;

      case MLBTeams.MiamiMarlins:
        _abbrName = MLBTeamAbbr.MiamiMarlins;
        break;

      case MLBTeams.BaltimoreOrioles:
        _abbrName = MLBTeamAbbr.BaltimoreOrioles;
        break;

      case MLBTeams.ClevelandIndians:
        _abbrName = MLBTeamAbbr.ClevelandIndians;
        break;

      case MLBTeams.CincinnatiReds:
        _abbrName = MLBTeamAbbr.CincinnatiReds;
        break;

      case MLBTeams.LosAngelesDodgers:
        _abbrName = MLBTeamAbbr.LosAngelesDodgers;
        break;

      case MLBTeams.NewYorkYankees:
        _abbrName = MLBTeamAbbr.NewYorkYankees;
        break;

      case MLBTeams.TampaBayRays:
        _abbrName = MLBTeamAbbr.TampaBayRays;
        break;

      case MLBTeams.HoustonAstros:
        _abbrName = MLBTeamAbbr.HoustonAstros;
        break;

      case MLBTeams.SanDiegoPadres:
        _abbrName = MLBTeamAbbr.SanDiegoPadres;
        break;

      case MLBTeams.MilwaukeeBrewers:
        _abbrName = MLBTeamAbbr.MilwaukeeBrewers;
        break;

      case MLBTeams.OaklandAthletics:
        _abbrName = MLBTeamAbbr.OaklandAthletics;
        break;

      case MLBTeams.AtlantaBraves:
        _abbrName = MLBTeamAbbr.AtlantaBraves;
        break;

      case MLBTeams.DetroitTigers:
        _abbrName = MLBTeamAbbr.DetroitTigers;
        break;

      case MLBTeams.ChicagoCubs:
        _abbrName = MLBTeamAbbr.ChicagoCubs;
        break;

      case MLBTeams.MinnesotaTwins:
        _abbrName = MLBTeamAbbr.MinnesotaTwins;
        break;
    }
    return _abbrName;
  }
}
