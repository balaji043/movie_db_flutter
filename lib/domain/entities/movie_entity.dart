// Package imports:
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final num voteAverage;
  final String posterPath;
  final String releaseDate;

  MovieEntity({
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
      id: map['id'],
      title: map['title'],
      voteAverage: map['voteAverage'],
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieEntity.fromJson(String source) =>
      MovieEntity.fromMap(json.decode(source));
}
