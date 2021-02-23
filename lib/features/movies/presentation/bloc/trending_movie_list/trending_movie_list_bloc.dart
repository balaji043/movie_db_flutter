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
import 'package:movie_db/domain/use_cases/get_Trending_movies.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';

part 'trending_movie_list_event.dart';
part 'trending_movie_list_state.dart';

class TrendingMovieListBloc
    extends Bloc<TrendingMovieListEvent, TrendingMovieListState> {
  final GetTrendingMovies getTrendingMovie;

  TrendingMovieListBloc(this.getTrendingMovie)
      : super(TrendingMovieListInitial());

  @override
  Stream<TrendingMovieListState> mapEventToState(
    TrendingMovieListEvent event,
  ) async* {
    if (event is TrendingMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await getTrendingMovie.call(null);
      yield movies.fold(
        (ApiError l) => TrendingMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            TrendingMovieListSuccess(movies: r),
      );
    }
  }
}
