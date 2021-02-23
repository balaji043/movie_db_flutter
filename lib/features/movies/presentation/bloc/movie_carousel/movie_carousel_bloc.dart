// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/domain/usecases/get_trending_movies.dart';
import 'package:movie_db/features/movies/presentation/bloc/movie_carousel_card/movie_carousel_card_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrendingMovies getTrendingMoviesUseCase;
  final MovieCarouselCardBloc movieCarouselCardBloc;

  MovieCarouselBloc(this.getTrendingMoviesUseCase, this.movieCarouselCardBloc)
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is MovieCarouselLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> response =
          await getTrendingMoviesUseCase.call(null);
      yield response.fold(
        (ApiError l) => MovieCarouselError(),
        (PaginatedResponse<MovieEntity> r) {
          movieCarouselCardBloc.add(
            MovieCarouselCardChangedEvent(r.results[event.defaultIndex]),
          );
          return MovieCarouselSuccess(
            movies: r,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}
