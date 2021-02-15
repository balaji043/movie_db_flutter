// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/src/components/movie_card.dart';

class MovieCarouselWidget extends StatelessWidget {
  final PaginatedResponse<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key key,
    @required this.movies,
    @required this.defaultIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // padding: const EdgeInsets.only(top: kDefaultPadding),
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: movies.results.length,
      itemBuilder: (context, index) {
        final MovieEntity dataContent = movies.results.elementAt(index);
        return MovieCardWidget(
          posterPath: dataContent.posterPath,
          releaseDate: dataContent.releaseDate,
          title: dataContent.title,
          voteAverage: (dataContent?.voteAverage ?? 0 * 10).toString(),
        );
      },
    );
  }
}
