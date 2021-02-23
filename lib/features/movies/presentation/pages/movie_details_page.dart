import 'package:flutter/material.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsPage({
    @required this.movie,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        movie.dTitle,
      );
}
