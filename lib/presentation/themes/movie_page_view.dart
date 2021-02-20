import 'package:flutter/material.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

class MoviePageView extends StatelessWidget {
  final PaginatedResponse<MovieEntity> movies;
  final int defaultIndex;

  const MoviePageView({
    @required this.movies,
    @required this.defaultIndex,
    Key key,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) => Container();
}
