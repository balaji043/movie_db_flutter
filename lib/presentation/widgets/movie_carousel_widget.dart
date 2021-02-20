// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/presentation/themes/movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final PaginatedResponse<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    @required this.movies,
    @required this.defaultIndex,
    Key key,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          MoviePageView(
            movies: movies,
            defaultIndex: defaultIndex,
          )
        ],
      );
}
