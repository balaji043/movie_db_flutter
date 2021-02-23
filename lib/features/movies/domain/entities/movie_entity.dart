// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:movie_db/domain/entities/ui_params.dart';

class MovieEntity extends Equatable implements UIParam {
  final int id;
  final String title;
  final num voteAverage;
  final String posterPath;
  final String releaseDate;
  final String backdropPath;
  final String overview;

  const MovieEntity(
      {@required this.id,
      @required this.title,
      @required this.voteAverage,
      @required this.posterPath,
      @required this.releaseDate,
      @required this.backdropPath,
      @required this.overview});

  @override
  List<Object> get props => <Object>[
        id,
        title,
      ];

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'title': title,
        'voteAverage': voteAverage,
        'posterPath': posterPath,
        'releaseDate': releaseDate,
      };

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return MovieEntity(
      id: map['id'],
      title: map['title'],
      voteAverage: map['vote_average'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieEntity.fromJson(String source) =>
      MovieEntity.fromMap(json.decode(source));

  @override
  String get dBackdropPath => backdropPath;

  @override
  String get dPosterPath => posterPath;

  @override
  String get dTitle => title;

  @override
  String get dOverview => overview;

  @override
  String get dReleaseDate => releaseDate;

  @override
  String get dRating => voteAverage?.toString() ?? '-';

  @override
  String get dId => id?.toString() ?? '';
}
