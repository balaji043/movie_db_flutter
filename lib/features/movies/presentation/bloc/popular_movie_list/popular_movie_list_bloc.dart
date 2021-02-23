// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/domain/usecases/get_popular_movies.dart';

part 'popular_movie_list_event.dart';
part 'popular_movie_list_state.dart';

class PopularMovieListBloc
    extends Bloc<PopularMovieListEvent, PopularMovieListState> {
  final GetPopularMovies getPopularMovies;

  PopularMovieListBloc(this.getPopularMovies)
      : super(PopularMovieListInitial());

  @override
  Stream<PopularMovieListState> mapEventToState(
    PopularMovieListEvent event,
  ) async* {
    if (event is PopularMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await getPopularMovies.call(null);
      yield movies.fold(
        (ApiError l) => PopularMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            PopularMovieListSuccess(movies: r),
      );
    }
  }
}
