import 'dart:convert';

BattersAndPichers battersAndPichersFromJson(String str) =>
    BattersAndPichers.fromJson(json.decode(str));

String battersAndPichersToJson(BattersAndPichers data) =>
    json.encode(data.toJson());

class BattersAndPichers {
  LiveData liveData;

  BattersAndPichers({
    this.liveData,
  });

  factory BattersAndPichers.fromJson(Map<String, dynamic> json) =>
      BattersAndPichers(
        liveData: LiveData.fromJson(json["liveData"]),
      );

  Map<String, dynamic> toJson() => {
        "liveData": liveData.toJson(),
      };
}

class LiveData {
  Boxscore boxscore;

  LiveData({
    this.boxscore,
  });

  factory LiveData.fromJson(Map<String, dynamic> json) => LiveData(
        boxscore: Boxscore.fromJson(json["boxscore"]),
      );

  Map<String, dynamic> toJson() => {
        "boxscore": boxscore.toJson(),
      };
}

class Boxscore {
  Teams teams;

  Boxscore({
    this.teams,
  });

  factory Boxscore.fromJson(Map<String, dynamic> json) => Boxscore(
        teams: Teams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "teams": teams.toJson(),
      };
}

class Teams {
  Away away;
  Home home;

  Teams({
    this.away,
    this.home,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        away: Away.fromJson(json["away"]),
        home: Home.fromJson(json["home"]),
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
  List<int> batters;
  List<int> pitchers;
  List<int> bench;
  List<int> bullpen;
  List<int> battingOrder;
  List<TeamStats> info;
  List<TeamStats> note;

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
        batters: List<int>.from(json["batters"].map((x) => x)),
        pitchers: List<int>.from(json["pitchers"].map((x) => x)),
        bench: List<int>.from(json["bench"].map((x) => x)),
        bullpen: List<int>.from(json["bullpen"].map((x) => x)),
        battingOrder: List<int>.from(json["battingOrder"].map((x) => x)),
        info: List<TeamStats>.from(
            json["info"].map((x) => TeamStats.fromJson(x))),
        note: List<TeamStats>.from(
            json["note"].map((x) => TeamStats.fromJson(x))),
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
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
        "note": List<dynamic>.from(note.map((x) => x.toJson())),
      };
}

class TeamStats {
  TeamStats();

  factory TeamStats.fromJson(Map<String, dynamic> json) => TeamStats();

  Map<String, dynamic> toJson() => {};
}

class Player {
  Team person;
  String jerseyNumber;
  TeamStats position;
  TeamStats stats;
  TeamStats status;
  int parentTeamId;
  TeamStats seasonStats;
  TeamStats gameStatus;
  List<TeamStats> allPositions;
  String battingOrder;

  Player({
    this.person,
    this.jerseyNumber,
    this.position,
    this.stats,
    this.status,
    this.parentTeamId,
    this.seasonStats,
    this.gameStatus,
    this.allPositions,
    this.battingOrder,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        person: Team.fromJson(json["person"]),
        jerseyNumber: json["jerseyNumber"],
        position: TeamStats.fromJson(json["position"]),
        stats: TeamStats.fromJson(json["stats"]),
        status: TeamStats.fromJson(json["status"]),
        parentTeamId: json["parentTeamId"],
        seasonStats: TeamStats.fromJson(json["seasonStats"]),
        gameStatus: TeamStats.fromJson(json["gameStatus"]),
        allPositions: json["allPositions"] == null
            ? null
            : List<TeamStats>.from(
                json["allPositions"].map((x) => TeamStats.fromJson(x))),
        battingOrder:
            json["battingOrder"] == null ? null : json["battingOrder"],
      );

  Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "jerseyNumber": jerseyNumber,
        "position": position.toJson(),
        "stats": stats.toJson(),
        "status": status.toJson(),
        "parentTeamId": parentTeamId,
        "seasonStats": seasonStats.toJson(),
        "gameStatus": gameStatus.toJson(),
        "allPositions": allPositions == null
            ? null
            : List<dynamic>.from(allPositions.map((x) => x.toJson())),
        "battingOrder": battingOrder == null ? null : battingOrder,
      };
}

class Team {
  int id;

  Team({
    this.id,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Home {
  Team team;
  TeamStats teamStats;
  Map<String, Player> players;
  List<int> batters;
  List<int> pitchers;
  List<int> bench;
  List<int> bullpen;
  List<int> battingOrder;
  List<TeamStats> info;
  List<dynamic> note;

  Home({
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

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        team: Team.fromJson(json["team"]),
        teamStats: TeamStats.fromJson(json["teamStats"]),
        players: Map.from(json["players"])
            .map((k, v) => MapEntry<String, Player>(k, Player.fromJson(v))),
        batters: List<int>.from(json["batters"].map((x) => x)),
        pitchers: List<int>.from(json["pitchers"].map((x) => x)),
        bench: List<int>.from(json["bench"].map((x) => x)),
        bullpen: List<int>.from(json["bullpen"].map((x) => x)),
        battingOrder: List<int>.from(json["battingOrder"].map((x) => x)),
        info: List<TeamStats>.from(
            json["info"].map((x) => TeamStats.fromJson(x))),
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
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
        "note": List<dynamic>.from(note.map((x) => x)),
      };
}
