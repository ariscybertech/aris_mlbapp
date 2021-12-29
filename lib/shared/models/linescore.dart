import 'dart:convert';

LineScore lineScoreFromJson(String str) => LineScore.fromJson(json.decode(str));

String lineScoreToJson(LineScore data) => json.encode(data.toJson());

class LineScore {
  String copyright;
  int currentInning;
  String currentInningOrdinal;
  String inningState;
  String inningHalf;
  bool isTopInning;
  int scheduledInnings;
  List<Inning> innings;
  Teams teams;
  Defense defense;
  Offense offense;
  int balls;
  int strikes;
  int outs;

  LineScore({
    this.copyright,
    this.currentInning,
    this.currentInningOrdinal,
    this.inningState,
    this.inningHalf,
    this.isTopInning,
    this.scheduledInnings,
    this.innings,
    this.teams,
    this.defense,
    this.offense,
    this.balls,
    this.strikes,
    this.outs,
  });

  factory LineScore.fromJson(Map<String, dynamic> json) => LineScore(
        copyright: json["copyright"],
        currentInning: json["currentInning"],
        currentInningOrdinal: json["currentInningOrdinal"],
        inningState: json["inningState"],
        inningHalf: json["inningHalf"],
        isTopInning: json["isTopInning"],
        scheduledInnings: json["scheduledInnings"],
        innings:
            List<Inning>.from(json["innings"].map((x) => Inning.fromJson(x))),
        teams: Teams.fromJson(json["teams"]),
        defense: Defense.fromJson(json["defense"]),
        offense: Offense.fromJson(json["offense"]),
        balls: json["balls"],
        strikes: json["strikes"],
        outs: json["outs"],
      );

  Map<String, dynamic> toJson() => {
        "copyright": copyright,
        "currentInning": currentInning,
        "currentInningOrdinal": currentInningOrdinal,
        "inningState": inningState,
        "inningHalf": inningHalf,
        "isTopInning": isTopInning,
        "scheduledInnings": scheduledInnings,
        "innings": List<dynamic>.from(innings.map((x) => x.toJson())),
        "teams": teams.toJson(),
        "defense": defense.toJson(),
        "offense": offense.toJson(),
        "balls": balls,
        "strikes": strikes,
        "outs": outs,
      };
}

class Defense {
  Catcher pitcher;
  Catcher catcher;
  Catcher first;
  Catcher second;
  Catcher third;
  Catcher shortstop;
  Catcher left;
  Catcher center;
  Catcher right;
  Team team;

  Defense({
    this.pitcher,
    this.catcher,
    this.first,
    this.second,
    this.third,
    this.shortstop,
    this.left,
    this.center,
    this.right,
    this.team,
  });

  factory Defense.fromJson(Map<String, dynamic> json) => Defense(
        pitcher: Catcher.fromJson(json["pitcher"]),
        catcher: Catcher.fromJson(json["catcher"]),
        first: Catcher.fromJson(json["first"]),
        second: Catcher.fromJson(json["second"]),
        third: Catcher.fromJson(json["third"]),
        shortstop: Catcher.fromJson(json["shortstop"]),
        left: Catcher.fromJson(json["left"]),
        center: Catcher.fromJson(json["center"]),
        right: Catcher.fromJson(json["right"]),
        team: Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "pitcher": pitcher.toJson(),
        "catcher": catcher.toJson(),
        "first": first.toJson(),
        "second": second.toJson(),
        "third": third.toJson(),
        "shortstop": shortstop.toJson(),
        "left": left.toJson(),
        "center": center.toJson(),
        "right": right.toJson(),
        "team": team.toJson(),
      };
}

class Catcher {
  int id;
  String fullName;
  String link;

  Catcher({
    this.id,
    this.fullName,
    this.link,
  });

  factory Catcher.fromJson(Map<String, dynamic> json) => Catcher(
        id: json["id"],
        fullName: json["fullName"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "link": link,
      };
}

class Team {
  int id;
  String name;
  String link;

  Team({
    this.id,
    this.name,
    this.link,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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

class Inning {
  int num;
  String ordinalNum;
  Away home;
  Away away;

  Inning({
    this.num,
    this.ordinalNum,
    this.home,
    this.away,
  });

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
        num: json["num"],
        ordinalNum: json["ordinalNum"],
        home: Away.fromJson(json["home"]),
        away: Away.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "ordinalNum": ordinalNum,
        "home": home.toJson(),
        "away": away.toJson(),
      };
}

class Away {
  int runs;
  int hits;
  int errors;
  int leftOnBase;

  Away({
    this.runs,
    this.hits,
    this.errors,
    this.leftOnBase,
  });

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        runs: json["runs"] == null ? null : json["runs"],
        hits: json["hits"],
        errors: json["errors"],
        leftOnBase: json["leftOnBase"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null ? null : runs,
        "hits": hits,
        "errors": errors,
        "leftOnBase": leftOnBase,
      };
}

class Offense {
  Catcher batter;
  Catcher onDeck;
  Catcher inHole;
  Catcher pitcher;
  Team team;

  Offense({
    this.batter,
    this.onDeck,
    this.inHole,
    this.pitcher,
    this.team,
  });

  factory Offense.fromJson(Map<String, dynamic> json) => Offense(
        batter: Catcher.fromJson(json["batter"]),
        onDeck: Catcher.fromJson(json["onDeck"]),
        inHole: Catcher.fromJson(json["inHole"]),
        pitcher: Catcher.fromJson(json["pitcher"]),
        team: Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "batter": batter.toJson(),
        "onDeck": onDeck.toJson(),
        "inHole": inHole.toJson(),
        "pitcher": pitcher.toJson(),
        "team": team.toJson(),
      };
}

class Teams {
  Away home;
  Away away;

  Teams({
    this.home,
    this.away,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: Away.fromJson(json["home"]),
        away: Away.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home.toJson(),
        "away": away.toJson(),
      };
}
