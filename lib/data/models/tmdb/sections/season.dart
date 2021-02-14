// To parse this JSON data, do
//
//     final season = seasonFromJson(jsonString);

import 'dart:convert';

import 'episode.dart';

Season seasonFromJson(String str) => Season.fromJson(json.decode(str));

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
        id: json["_id"] == null ? null : json["_id"],
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodes: json["episodes"] == null
            ? null
            : List<Episode>.from(
                json["episodes"].map((x) => Episode.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        seasonId: json["id"] == null ? null : json["id"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        seasonNumber:
            json["season_number"] == null ? null : json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "air_date": airDate == null
            ? null
            : "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "overview": overview == null ? null : overview,
        "id": seasonId == null ? null : seasonId,
        "poster_path": posterPath == null ? null : posterPath,
        "season_number": seasonNumber == null ? null : seasonNumber,
      };
}
