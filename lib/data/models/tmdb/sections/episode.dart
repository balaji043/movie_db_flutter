// To parse this JSON data, do
//
//     final episode = episodeFromJson(jsonString);

import 'dart:convert';

Episode episodeFromJson(String str) => Episode.fromJson(json.decode(str));

String episodeToJson(Episode data) => json.encode(data.toJson());

class Episode {
  Episode({
    this.airDate,
    this.crew,
    this.episodeNumber,
    this.guestStars,
    this.name,
    this.overview,
    this.id,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  DateTime airDate;
  List<Crew> crew;
  int episodeNumber;
  List<GuestStar> guestStars;
  String name;
  String overview;
  int id;
  String productionCode;
  int seasonNumber;
  String stillPath;
  double voteAverage;
  int voteCount;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        crew: json["crew"] == null
            ? null
            : List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
        episodeNumber:
            json["episode_number"] == null ? null : json["episode_number"],
        guestStars: json["guest_stars"] == null
            ? null
            : List<GuestStar>.from(
                json["guest_stars"].map((x) => GuestStar.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        id: json["id"] == null ? null : json["id"],
        productionCode:
            json["production_code"] == null ? null : json["production_code"],
        seasonNumber:
            json["season_number"] == null ? null : json["season_number"],
        stillPath: json["still_path"] == null ? null : json["still_path"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate == null
            ? null
            : "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "crew": crew == null
            ? null
            : List<dynamic>.from(crew.map((x) => x.toJson())),
        "episode_number": episodeNumber == null ? null : episodeNumber,
        "guest_stars": guestStars == null
            ? null
            : List<dynamic>.from(guestStars.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "overview": overview == null ? null : overview,
        "id": id == null ? null : id,
        "production_code": productionCode == null ? null : productionCode,
        "season_number": seasonNumber == null ? null : seasonNumber,
        "still_path": stillPath == null ? null : stillPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}

class Crew {
  Crew({
    this.id,
    this.creditId,
    this.name,
    this.department,
    this.job,
    this.profilePath,
  });

  int id;
  String creditId;
  String name;
  String department;
  String job;
  String profilePath;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        id: json["id"] == null ? null : json["id"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        name: json["name"] == null ? null : json["name"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "credit_id": creditId == null ? null : creditId,
        "name": name == null ? null : name,
        "department": department == null ? null : department,
        "job": job == null ? null : job,
        "profile_path": profilePath == null ? null : profilePath,
      };
}

class GuestStar {
  GuestStar({
    this.id,
    this.name,
    this.creditId,
    this.character,
    this.order,
    this.profilePath,
  });

  int id;
  String name;
  String creditId;
  String character;
  int order;
  String profilePath;

  factory GuestStar.fromJson(Map<String, dynamic> json) => GuestStar(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        character: json["character"] == null ? null : json["character"],
        order: json["order"] == null ? null : json["order"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "credit_id": creditId == null ? null : creditId,
        "character": character == null ? null : character,
        "order": order == null ? null : order,
        "profile_path": profilePath == null ? null : profilePath,
      };
}
