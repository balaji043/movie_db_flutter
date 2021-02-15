// To parse this JSON data, do
//
//     final season = seasonFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'episode.dart';

Season seasonFromJson(String str) =>
    Season.fromJson(json.decode(str) as Map<String, dynamic>);

String seasonToJson(Season data) => json.encode(data.toJson());

class Season {
  Season({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.seasonId,
    this.posterPath,
    this.seasonNumber,
  });

  String id;
  DateTime airDate;
  List<Episode> episodes;
  String name;
  String overview;
  int seasonId;
  String posterPath;
  int seasonNumber;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["_id"] as String,
        airDate: json["air_date"] == null
            ? null
            : DateTime.parse(json["air_date"] as String),
        episodes: json["episodes"] == null
            ? null
            : List<Episode>.from((json["episodes"] as List)
                .map((x) => Episode.fromJson(x as Map<String, dynamic>))),
        name: json["name"] as String,
        overview: json["overview"] as String,
        seasonId: json["id"] as int,
        posterPath: json["poster_path"] as String,
        seasonNumber: json["season_number"] as int,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "air_date": airDate == null
            ? null
            : "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes.map((x) => x.toJson())),
        "name": name,
        "overview": overview,
        "id": seasonId,
        "poster_path": posterPath,
        "season_number": seasonNumber,
      };
}
