// To parse this JSON data, do
//
//     final season = seasonFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:movie_db/core/extensions.dart';
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
        id: json['_id'],
        airDate:
            json['air_date'] == null ? null : DateTime.parse(json['air_date']),
        episodes: json['episodes'] == null
            ? null
            : List<Episode>.from(
                json['episodes'].map(
                  (dynamic x) => Episode.fromJson(x),
                ),
              ),
        name: json['name'],
        overview: json['overview'],
        seasonId: json['id'],
        posterPath: json['poster_path'],
        seasonNumber: json['season_number'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'air_date': airDate?.paddedString,
        'episodes': episodes == null
            ? null
            : List<dynamic>.from(episodes.map((dynamic x) => x.toJson())),
        'name': name,
        'overview': overview,
        'id': seasonId,
        'poster_path': posterPath,
        'season_number': seasonNumber,
      };
}
