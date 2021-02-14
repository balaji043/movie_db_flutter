// Package imports:
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
}
