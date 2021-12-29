import 'dart:convert';

Scores scoresFromJson(String str) => Scores.fromJson(json.decode(str));

String scoresToJson(Scores data) => json.encode(data.toJson());

class Scores {
  String copyright;
  int totalItems;
  int totalEvents;
  int totalGames;
  int totalGamesInProgress;
  List<Date> dates;

  Scores({
    this.copyright,
    this.totalItems,
    this.totalEvents,
    this.totalGames,
    this.totalGamesInProgress,
    this.dates,
  });

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        copyright: json["copyright"],
        totalItems: json["totalItems"],
        totalEvents: json["totalEvents"],
        totalGames: json["totalGames"],
        totalGamesInProgress: json["totalGamesInProgress"],
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "totalItems": totalItems,
        "totalEvents": totalEvents,
        "totalGames": totalGames,
        "totalGamesInProgress": totalGamesInProgress,
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
      };
}

class Date {
  DateTime date;
  int totalItems;
  int totalEvents;
  int totalGames;
  int totalGamesInProgress;
  List<Game> games;
  List<dynamic> events;

  Date({
    this.date,
    this.totalItems,
    this.totalEvents,
    this.totalGames,
    this.totalGamesInProgress,
    this.games,
    this.events,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateTime.parse(json["date"]),
        totalItems: json["totalItems"],
        totalEvents: json["totalEvents"],
        totalGames: json["totalGames"],
        totalGamesInProgress: json["totalGamesInProgress"],
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
        events: List<dynamic>.from(json["events"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "totalItems": totalItems,
        "totalEvents": totalEvents,
        "totalGames": totalGames,
        "totalGamesInProgress": totalGamesInProgress,
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
        "events": List<dynamic>.from(events.map((x) => x)),
      };
}

class Game {
  int gamePk;
  String link;
  GameType gameType;
  String season;
  DateTime gameDate;
  Status status;
  Teams teams;
  Venue venue;
  Content content;
  bool isTie;
  int gameNumber;
  bool publicFacing;
  DoubleHeader doubleHeader;
  GamedayType gamedayType;
  DoubleHeader tiebreaker;
  String calendarEventId;
  String seasonDisplay;
  DayNight dayNight;
  int scheduledInnings;
  int inningBreakLength;
  int gamesInSeries;
  int seriesGameNumber;
  SeriesDescription seriesDescription;
  RecordSource recordSource;
  DoubleHeader ifNecessary;
  IfNecessaryDescription ifNecessaryDescription;

  Game({
    this.gamePk,
    this.link,
    this.gameType,
    this.season,
    this.gameDate,
    this.status,
    this.teams,
    this.venue,
    this.content,
    this.isTie,
    this.gameNumber,
    this.publicFacing,
    this.doubleHeader,
    this.gamedayType,
    this.tiebreaker,
    this.calendarEventId,
    this.seasonDisplay,
    this.dayNight,
    this.scheduledInnings,
    this.inningBreakLength,
    this.gamesInSeries,
    this.seriesGameNumber,
    this.seriesDescription,
    this.recordSource,
    this.ifNecessary,
    this.ifNecessaryDescription,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        gamePk: json["gamePk"],
        link: json["link"],
        gameType: gameTypeValues.map[json["gameType"]],
        season: json["season"],
        gameDate: DateTime.parse(json["gameDate"]),
        status: Status.fromJson(json["status"]),
        teams: Teams.fromJson(json["teams"]),
        venue: Venue.fromJson(json["venue"]),
        content: Content.fromJson(json["content"]),
        isTie: json["isTie"],
        gameNumber: json["gameNumber"],
        publicFacing: json["publicFacing"],
        doubleHeader: doubleHeaderValues.map[json["doubleHeader"]],
        gamedayType: gamedayTypeValues.map[json["gamedayType"]],
        tiebreaker: doubleHeaderValues.map[json["tiebreaker"]],
        calendarEventId: json["calendarEventID"],
        seasonDisplay: json["seasonDisplay"],
        dayNight: dayNightValues.map[json["dayNight"]],
        scheduledInnings: json["scheduledInnings"],
        inningBreakLength: json["inningBreakLength"],
        gamesInSeries: json["gamesInSeries"],
        seriesGameNumber: json["seriesGameNumber"],
        seriesDescription:
            seriesDescriptionValues.map[json["seriesDescription"]],
        recordSource: recordSourceValues.map[json["recordSource"]],
        ifNecessary: doubleHeaderValues.map[json["ifNecessary"]],
        ifNecessaryDescription:
            ifNecessaryDescriptionValues.map[json["ifNecessaryDescription"]],
      );

  Map<String, dynamic> toJson() => {
        "gamePk": gamePk,
        "link": link,
        "gameType": gameTypeValues.reverse[gameType],
        "season": season,
        "gameDate": gameDate.toIso8601String(),
        "status": status.toJson(),
        "teams": teams.toJson(),
        "venue": venue.toJson(),
        "content": content.toJson(),
        "isTie": isTie,
        "gameNumber": gameNumber,
        "publicFacing": publicFacing,
        "doubleHeader": doubleHeaderValues.reverse[doubleHeader],
        "gamedayType": gamedayTypeValues.reverse[gamedayType],
        "tiebreaker": doubleHeaderValues.reverse[tiebreaker],
        "calendarEventID": calendarEventId,
        "seasonDisplay": seasonDisplay,
        "dayNight": dayNightValues.reverse[dayNight],
        "scheduledInnings": scheduledInnings,
        "inningBreakLength": inningBreakLength,
        "gamesInSeries": gamesInSeries,
        "seriesGameNumber": seriesGameNumber,
        "seriesDescription": seriesDescriptionValues.reverse[seriesDescription],
        "recordSource": recordSourceValues.reverse[recordSource],
        "ifNecessary": doubleHeaderValues.reverse[ifNecessary],
        "ifNecessaryDescription":
            ifNecessaryDescriptionValues.reverse[ifNecessaryDescription],
      };
}

class Content {
  String link;

  Content({
    this.link,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}

enum DayNight { DAY }

final dayNightValues = EnumValues({"day": DayNight.DAY});

enum DoubleHeader { N }

final doubleHeaderValues = EnumValues({"N": DoubleHeader.N});

enum GameType { R }

final gameTypeValues = EnumValues({"R": GameType.R});

enum GamedayType { P }

final gamedayTypeValues = EnumValues({"P": GamedayType.P});

enum IfNecessaryDescription { NORMAL_GAME }

final ifNecessaryDescriptionValues =
    EnumValues({"Normal Game": IfNecessaryDescription.NORMAL_GAME});

enum RecordSource { S }

final recordSourceValues = EnumValues({"S": RecordSource.S});

enum SeriesDescription { REGULAR_SEASON }

final seriesDescriptionValues =
    EnumValues({"Regular Season": SeriesDescription.REGULAR_SEASON});

class Status {
  State abstractGameState;
  AbstractGameCode codedGameState;
  State detailedState;
  AbstractGameCode statusCode;
  AbstractGameCode abstractGameCode;

  Status({
    this.abstractGameState,
    this.codedGameState,
    this.detailedState,
    this.statusCode,
    this.abstractGameCode,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        abstractGameState: stateValues.map[json["abstractGameState"]],
        codedGameState: abstractGameCodeValues.map[json["codedGameState"]],
        detailedState: stateValues.map[json["detailedState"]],
        statusCode: abstractGameCodeValues.map[json["statusCode"]],
        abstractGameCode: abstractGameCodeValues.map[json["abstractGameCode"]],
      );

  Map<String, dynamic> toJson() => {
        "abstractGameState": stateValues.reverse[abstractGameState],
        "codedGameState": abstractGameCodeValues.reverse[codedGameState],
        "detailedState": stateValues.reverse[detailedState],
        "statusCode": abstractGameCodeValues.reverse[statusCode],
        "abstractGameCode": abstractGameCodeValues.reverse[abstractGameCode],
      };
}

enum AbstractGameCode { F }

final abstractGameCodeValues = EnumValues({"F": AbstractGameCode.F});

enum State { FINAL }

final stateValues = EnumValues({"Final": State.FINAL});

class Teams {
  Away away;
  Away home;

  Teams({
    this.away,
    this.home,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        away: Away.fromJson(json["away"]),
        home: Away.fromJson(json["home"]),
      );

  Map<String, dynamic> toJson() => {
        "away": away.toJson(),
        "home": home.toJson(),
      };
}

class Away {
  LeagueRecord leagueRecord;
  int score;
  Venue team;
  bool isWinner;
  bool splitSquad;
  int seriesNumber;

  Away({
    this.leagueRecord,
    this.score,
    this.team,
    this.isWinner,
    this.splitSquad,
    this.seriesNumber,
  });

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        leagueRecord: LeagueRecord.fromJson(json["leagueRecord"]),
        score: json["score"],
        team: Venue.fromJson(json["team"]),
        isWinner: json["isWinner"],
        splitSquad: json["splitSquad"],
        seriesNumber: json["seriesNumber"],
      );

  Map<String, dynamic> toJson() => {
        "leagueRecord": leagueRecord.toJson(),
        "score": score,
        "team": team.toJson(),
        "isWinner": isWinner,
        "splitSquad": splitSquad,
        "seriesNumber": seriesNumber,
      };
}

class LeagueRecord {
  int wins;
  int losses;
  String pct;

  LeagueRecord({
    this.wins,
    this.losses,
    this.pct,
  });

  factory LeagueRecord.fromJson(Map<String, dynamic> json) => LeagueRecord(
        wins: json["wins"],
        losses: json["losses"],
        pct: json["pct"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "losses": losses,
        "pct": pct,
      };
}

class Venue {
  int id;
  String name;
  String link;

  Venue({
    this.id,
    this.name,
    this.link,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
