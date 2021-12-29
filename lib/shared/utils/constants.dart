/// All the constants used inside the app.

class SimpleBetConstants {
  static const String kAppTitle = "TODAY'S GAMES";

  static const String kAssetsUrl = 'assets/images/';

  static const List<String> index = [
    '',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'R',
    'H',
    'E',
  ];

  static const String kHittingSection = 'Hitting';

  static const String kPitchingSection = 'Pitching';

  static const List<String> kHittingIndex = [
    'HITTERS',
    'AB',
    'R',
    'H',
    'RBI',
  ];

  static const List<String> kPitchingIndex = [
    'PITCHERS',
    'IP',
    'H',
    'R',
    'K',
  ];
}

class MLBTeams {
  static const String PhiladelphiaPhillies = 'Philadelphia Phillies';
  static const String BostonRedSox = 'Boston Red Sox';
  static const String WashingtonNationals = 'Washington Nationals';
  static const String PittsburghPirates = 'Pittsburgh Pirates';
  static const String SanFranciscoGiants = 'San Francisco Giants';
  static const String TexasRangers = 'Texas Rangers';
  static const String TorontoBlueJays = 'Toronto Blue Jays';
  static const String LosAngelesAngels = 'Los Angeles Angels';
  static const String ArizonaDiamondbacks = 'Arizona Diamondbacks';
  static const String ColoradoRockies = 'Colorado Rockies';
  static const String SeattleMariners = 'Seattle Mariners';
  static const String NewYorkMets = 'New York Mets';
  static const String ChicagoWhiteSox = 'Chicago White Sox';
  static const String StLouisCardinals = 'St. Louis Cardinals';
  static const String KansasCityRoyals = 'Kansas City Royals';
  static const String MiamiMarlins = 'Miami Marlins';
  static const String BaltimoreOrioles = 'Baltimore Orioles';
  static const String ClevelandIndians = 'Cleveland Indians';
  static const String CincinnatiReds = 'Cincinnati Reds';
  static const String LosAngelesDodgers = 'Los Angeles Dodgers';
  static const String NewYorkYankees = 'New York Yankees';
  static const String TampaBayRays = 'Tampa Bay Rays';
  static const String HoustonAstros = 'Houston Astros';
  static const String SanDiegoPadres = 'San Diego Padres';
  static const String MilwaukeeBrewers = 'Milwaukee Brewers';
  static const String OaklandAthletics = 'Oakland Athletics';
  static const String AtlantaBraves = 'Atlanta Braves';
  static const String DetroitTigers = 'Detroit Tigers';
  static const String ChicagoCubs = 'Chicago Cubs';
  static const String MinnesotaTwins = 'Minnesota Twins';
}

class MLBTeamAbbr {
  static const String PhiladelphiaPhillies = 'PHI';
  static const String BostonRedSox = 'BOS';
  static const String WashingtonNationals = 'WSH';
  static const String PittsburghPirates = 'PIT';
  static const String SanFranciscoGiants = 'SFG';
  static const String TexasRangers = 'TEX';
  static const String TorontoBlueJays = 'TOR';
  static const String LosAngelesAngels = 'LAA';
  static const String ArizonaDiamondbacks = 'ARI';
  static const String ColoradoRockies = 'COL';
  static const String SeattleMariners = 'SEA';
  static const String NewYorkMets = 'NYM';
  static const String ChicagoWhiteSox = 'CWS';
  static const String StLouisCardinals = 'STL';
  static const String KansasCityRoyals = 'KCR';
  static const String MiamiMarlins = 'MIA';
  static const String BaltimoreOrioles = 'BAL';
  static const String ClevelandIndians = 'CLE';
  static const String CincinnatiReds = 'CIN';
  static const String LosAngelesDodgers = 'LAD';
  static const String NewYorkYankees = 'NYY';
  static const String TampaBayRays = 'TB';
  static const String HoustonAstros = 'HOU';
  static const String SanDiegoPadres = 'SDP';
  static const String MilwaukeeBrewers = 'MIL';
  static const String OaklandAthletics = 'OAK';
  static const String AtlantaBraves = 'ATL';
  static const String DetroitTigers = 'DET';
  static const String ChicagoCubs = 'CHC';
  static const String MinnesotaTwins = 'MIN';
}

class UrlConstants {
  static const String kScoresAPI =
      'https://statsapi.mlb.com/api/v1/schedule/?sportId=1&date=09/29/2019';

  static const String kGenericAPI = 'https://statsapi.mlb.com/api/v1/game/';

  static const String kBattersPitchersAPIPartOne =
      'https://statsapi.mlb.com/api/v1.1/game/';

  static const String kBattersPitchersAPIPartTwo =
      '/feed/live?fields=liveData,boxscore,teams,id,batters,pitchers,battingOrder';

  static const String kPlayerStatsAPIPartTwo =
      '/boxscore?fields=teams,record,wins,losses,players,fullName,position,name,type,abbreviation,stats,batting,doubles,triples,homeRuns,strikeOuts,fielding,assists,errors,putOuts,pitching,runs,atBats,hits,rbi,inningsPitched,strikeOuts';
}
