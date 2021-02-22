import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/data/models/core.dart';

class MovieCarouselWidget extends StatefulWidget {
  final int defaultIndex;
  final PaginatedResponse<MovieEntity> movies;

  const MovieCarouselWidget({
    Key key,
    this.defaultIndex,
    this.movies,
  }) : super(key: key);

  @override
  _MovieCarouselWidgetState createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.defaultIndex,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          final MovieEntity movie = widget.movies.results[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            movieId: movie.id,
            posterPath: movie.backdropPath,
          );
        },
        itemCount: widget.movies.results?.length ?? 0,
      );
}

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget({
    @required this.index,
    @required this.movieId,
    @required this.posterPath,
    @required this.pageController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: pageController,
        builder: (BuildContext context, Widget child) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - index;
            value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: child,
              ),
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: child,
              ),
            );
          }
        },
        child: MovieCardWidget(
          movieId: movieId,
          posterPath: posterPath,
        ),
      );
}

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    @required this.movieId,
    @required this.posterPath,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        elevation: 32,
        borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(
            //   RouteList.movieDetail,
            //   arguments: MovieDetailArguments(movieId),
            // );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: Image.network(
              '${ApiConstants.tmdbImageBaseUrlV3}$posterPath',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
