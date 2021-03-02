// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:movie_db/data/models/models.dart';
import 'package:movie_db/domain/entities/entities.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entities.dart';
import 'package:movie_db/features/movies/domain/usecases/movie_usecases.dart';
import 'package:movie_db/features/movies/presentation/bloc/movie_carousel_card/movie_carousel_card_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrendingMovies _getTrendingMoviesUseCase;
  final MovieCarouselCardBloc _movieCarouselCardBloc;

  MovieCarouselBloc(
    this._getTrendingMoviesUseCase,
    this._movieCarouselCardBloc,
  ) : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is MovieCarouselLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> response =
          await _getTrendingMoviesUseCase.call(null);
      yield response.fold(
        (ApiError l) => MovieCarouselError(),
        (PaginatedResponse<MovieEntity> r) {
          final List<MovieEntity> movieEntities = r.results
              .where((element) => element.backdropPath != null)
              .toList();
          _movieCarouselCardBloc.add(
            MovieCarouselCardChangedEvent(movieEntities[event.defaultIndex]),
          );
          return MovieCarouselSuccess(
            movies: movieEntities,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}
