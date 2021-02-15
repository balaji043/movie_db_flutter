// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final num voteAverage;
  final String posterPath;
  final String releaseDate;

  const MovieEntity({
    @required this.id,
    @required this.title,
    @required this.voteAverage,
    @required this.posterPath,
    @required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
    };
  }

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovieEntity(
      id: map['id'] == null ? null : map["id"] as int,
      title: map["title"] == null ? null : map["title"] as String,
      voteAverage:
          map["vote_average"] == null ? null : map["vote_average"] as double,
      posterPath: map["poster_path"] as String,
      releaseDate:
          map["release_date"] == null ? null : map["release_date"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieEntity.fromJson(String source) =>
      MovieEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
