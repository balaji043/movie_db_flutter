// To parse this JSON data, do
//
//     final episode = episodeFromJson(jsonString);

// Dart imports:
import 'dart:convert';

Episode episodeFromJson(String str) =>
    Episode.fromJson(json.decode(str) as Map<String, dynamic>);

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
        airDate: json["air_date"] == null
            ? null
            : DateTime.parse(json["air_date"] as String),
        crew: json["crew"] == null
            ? null
            : List<Crew>.from((json["crew"] as List)
                .map((x) => Crew.fromJson(x as Map<String, dynamic>))),
        episodeNumber: json["episode_number"] as int,
        guestStars: json["guest_stars"] == null
            ? null
            : List<GuestStar>.from(
                (json["guest_stars"] as List).map(
                  (x) => GuestStar.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ),
              ),
        name: json["name"] as String,
        overview: json["overview"] as String,
        id: json["id"] as int,
        productionCode: json["production_code"] as String,
        seasonNumber: json["season_number"] as int ?? 0,
        stillPath: json["still_path"] as String,
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"] as double,
        voteCount: json["vote_count"] as int,
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate == null
            ? null
            : "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "crew": crew == null
            ? null
            : List<dynamic>.from(crew.map((x) => x.toJson())),
        "episode_number": episodeNumber,
        "guest_stars": guestStars == null
            ? null
            : List<dynamic>.from(guestStars.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": id,
        "production_code": productionCode,
        "season_number": seasonNumber,
        "still_path": stillPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
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
        id: json["id"] as int,
        creditId: json["credit_id"] as String,
        name: json["name"] as String,
        department: json["department"] as String,
        job: json["job"] as String,
        profilePath: json["profile_path"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "credit_id": creditId,
        "name": name,
        "department": department,
        "job": job,
        "profile_path": profilePath,
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
        id: json["id"] as int,
        name: json["name"] as String,
        creditId: json["credit_id"] as String,
        character: json["character"] as String,
        order: json["order"] as int,
        profilePath: json["profile_path"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "credit_id": creditId,
        "character": character,
        "order": order,
        "profile_path": profilePath,
      };
}
