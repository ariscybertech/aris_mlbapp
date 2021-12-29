import 'dart:convert';

PlayerStats playerStatsFromJson(String str) =>
    PlayerStats.fromJson(json.decode(str));

String playerStatsToJson(PlayerStats data) => json.encode(data.toJson());

class PlayerStats {
  Teams teams;

  PlayerStats({
    this.teams,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> json) => PlayerStats(
        teams: Teams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "teams": teams.toJson(),
      };
}

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
  Team team;
  TeamStats teamStats;
  Map<String, Player> players;
  List<dynamic> batters;
  List<dynamic> pitchers;
  List<dynamic> bench;
  List<dynamic> bullpen;
  List<dynamic> battingOrder;
  List<dynamic> info;
  List<dynamic> note;

  Away({
    this.team,
    this.teamStats,
    this.players,
    this.batters,
    this.pitchers,
    this.bench,
    this.bullpen,
    this.battingOrder,
    this.info,
    this.note,
  });

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        team: Team.fromJson(json["team"]),
        teamStats: TeamStats.fromJson(json["teamStats"]),
        players: Map.from(json["players"])
            .map((k, v) => MapEntry<String, Player>(k, Player.fromJson(v))),
        batters: List<dynamic>.from(json["batters"].map((x) => x)),
        pitchers: List<dynamic>.from(json["pitchers"].map((x) => x)),
        bench: List<dynamic>.from(json["bench"].map((x) => x)),
        bullpen: List<dynamic>.from(json["bullpen"].map((x) => x)),
        battingOrder: List<dynamic>.from(json["battingOrder"].map((x) => x)),
        info: List<dynamic>.from(json["info"].map((x) => x)),
        note: List<dynamic>.from(json["note"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "teamStats": teamStats.toJson(),
        "players": Map.from(players)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "batters": List<dynamic>.from(batters.map((x) => x)),
        "pitchers": List<dynamic>.from(pitchers.map((x) => x)),
        "bench": List<dynamic>.from(bench.map((x) => x)),
        "bullpen": List<dynamic>.from(bullpen.map((x) => x)),
        "battingOrder": List<dynamic>.from(battingOrder.map((x) => x)),
        "info": List<dynamic>.from(info.map((x) => x)),
        "note": List<dynamic>.from(note.map((x) => x)),
      };
}

class Player {
  Person person;
  String jerseyNumber;
  Position position;
  Stats stats;
  Status status;
  int parentTeamId;
  Stats seasonStats;

  Player({
    this.person,
    this.jerseyNumber,
    this.position,
    this.stats,
    this.status,
    this.parentTeamId,
    this.seasonStats,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        person: Person.fromJson(json["person"]),
        jerseyNumber: json["jerseyNumber"],
        position: Position.fromJson(json["position"]),
        stats: Stats.fromJson(json["stats"]),
        status: Status.fromJson(json["status"]),
        parentTeamId: json["parentTeamId"],
        seasonStats: Stats.fromJson(json["seasonStats"]),
      );

  Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "jerseyNumber": jerseyNumber,
        "position": position.toJson(),
        "stats": stats.toJson(),
        "status": status.toJson(),
        "parentTeamId": parentTeamId,
        "seasonStats": seasonStats.toJson(),
      };
}

class Person {
  String fullName;

  Person({
    this.fullName,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
      };
}

class Position {
  Name name;
  Name type;
  String abbreviation;

  Position({
    this.name,
    this.type,
    this.abbreviation,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        name: nameValues.map[json["name"]],
        type: nameValues.map[json["type"]],
        abbreviation: json["abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "type": nameValues.reverse[type],
        "abbreviation": abbreviation,
      };
}

enum Name {
  FIRST_BASE,
  PITCHER,
  THIRD_BASE,
  CATCHER,
  OUTFIELDER,
  SHORTSTOP,
  OUTFIELD,
  SECOND_BASE,
  INFIELDER
}

final nameValues = EnumValues({
  "Catcher": Name.CATCHER,
  "First Base": Name.FIRST_BASE,
  "Infielder": Name.INFIELDER,
  "Outfield": Name.OUTFIELD,
  "Outfielder": Name.OUTFIELDER,
  "Pitcher": Name.PITCHER,
  "Second Base": Name.SECOND_BASE,
  "Shortstop": Name.SHORTSTOP,
  "Third Base": Name.THIRD_BASE
});

class Stats {
  Status batting;
  Status pitching;
  Status fielding;

  Stats({
    this.batting,
    this.pitching,
    this.fielding,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        batting: Status.fromJson(json["batting"]),
        pitching: Status.fromJson(json["pitching"]),
        fielding: Status.fromJson(json["fielding"]),
      );

  Map<String, dynamic> toJson() => {
        "batting": batting.toJson(),
        "pitching": pitching.toJson(),
        "fielding": fielding.toJson(),
      };
}

class Status {
  Status();

  factory Status.fromJson(Map<String, dynamic> json) => Status();

  Map<String, dynamic> toJson() => {};
}

class Team {
  String name;
  String abbreviation;
  Record record;

  Team({
    this.name,
    this.abbreviation,
    this.record,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        abbreviation: json["abbreviation"],
        record: Record.fromJson(json["record"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "abbreviation": abbreviation,
        "record": record.toJson(),
      };
}

class Record {
  int wins;
  int losses;

  Record({
    this.wins,
    this.losses,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        wins: json["wins"],
        losses: json["losses"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "losses": losses,
      };
}

class TeamStats {
  Ing batting;
  Ing pitching;
  Fielding fielding;

  TeamStats({
    this.batting,
    this.pitching,
    this.fielding,
  });

  factory TeamStats.fromJson(Map<String, dynamic> json) => TeamStats(
        batting: Ing.fromJson(json["batting"]),
        pitching: Ing.fromJson(json["pitching"]),
        fielding: Fielding.fromJson(json["fielding"]),
      );

  Map<String, dynamic> toJson() => {
        "batting": batting.toJson(),
        "pitching": pitching.toJson(),
        "fielding": fielding.toJson(),
      };
}

class Ing {
  int runs;
  int doubles;
  int triples;
  int homeRuns;
  int strikeOuts;
  int hits;
  int atBats;
  int rbi;
  String inningsPitched;

  Ing({
    this.runs,
    this.doubles,
    this.triples,
    this.homeRuns,
    this.strikeOuts,
    this.hits,
    this.atBats,
    this.rbi,
    this.inningsPitched,
  });

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        runs: json["runs"],
        doubles: json["doubles"],
        triples: json["triples"],
        homeRuns: json["homeRuns"],
        strikeOuts: json["strikeOuts"],
        hits: json["hits"],
        atBats: json["atBats"],
        rbi: json["rbi"],
        inningsPitched:
            json["inningsPitched"] == null ? null : json["inningsPitched"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs,
        "doubles": doubles,
        "triples": triples,
        "homeRuns": homeRuns,
        "strikeOuts": strikeOuts,
        "hits": hits,
        "atBats": atBats,
        "rbi": rbi,
        "inningsPitched": inningsPitched == null ? null : inningsPitched,
      };
}

class Fielding {
  int assists;
  int putOuts;
  int errors;

  Fielding({
    this.assists,
    this.putOuts,
    this.errors,
  });

  factory Fielding.fromJson(Map<String, dynamic> json) => Fielding(
        assists: json["assists"],
        putOuts: json["putOuts"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "assists": assists,
        "putOuts": putOuts,
        "errors": errors,
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
