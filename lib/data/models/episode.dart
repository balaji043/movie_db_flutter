// To parse this JSON data, do
//
//     final episode = episodeFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:movie_db/core/extensions.dart';

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
            json['air_date'] == null ? null : DateTime.parse(json['air_date']),
        crew: json['crew'] == null
            ? null
            : List<Crew>.from(
                (json['crew']).map(
                  (dynamic x) => Crew.fromJson(x),
                ),
              ),
        episodeNumber: json['episode_number'],
        guestStars: json['guest_stars'] == null
            ? null
            : List<GuestStar>.from(
                (json['guest_stars']).map(
                  (dynamic x) => GuestStar.fromJson(
                    x,
                  ),
                ),
              ),
        name: json['name'],
        overview: json['overview'],
        id: json['id'],
        productionCode: json['production_code'],
        seasonNumber: json['season_number'] ?? 0,
        stillPath: json['still_path'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'air_date': airDate?.paddedString,
        'crew': crew == null
            ? null
            : List<dynamic>.from(crew.map((dynamic x) => x.toJson())),
        'episode_number': episodeNumber,
        'guest_stars': guestStars == null
            ? null
            : List<dynamic>.from(guestStars.map((dynamic x) => x.toJson())),
        'name': name,
        'overview': overview,
        'id': id,
        'production_code': productionCode,
        'season_number': seasonNumber,
        'still_path': stillPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
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
        id: json['id'],
        creditId: json['credit_id'],
        name: json['name'],
        department: json['department'],
        job: json['job'],
        profilePath: json['profile_path'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'credit_id': creditId,
        'name': name,
        'department': department,
        'job': job,
        'profile_path': profilePath,
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
        id: json['id'],
        name: json['name'],
        creditId: json['credit_id'],
        character: json['character'],
        order: json['order'],
        profilePath: json['profile_path'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'credit_id': creditId,
        'character': character,
        'order': order,
        'profile_path': profilePath,
      };
}
