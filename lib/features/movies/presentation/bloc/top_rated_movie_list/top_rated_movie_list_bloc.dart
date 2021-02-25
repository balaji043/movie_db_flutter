// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:movie_db/data/models/models.dart';
import 'package:movie_db/domain/entities/entities.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entities.dart';
import 'package:movie_db/features/movies/domain/usecases/movie_usecases.dart';

part 'top_rated_movie_list_event.dart';
part 'top_rated_movie_list_state.dart';

class TopRatedMovieListBloc
    extends Bloc<TopRatedMovieListEvent, TopRatedMovieListState> {
  final GetTopRatedMovies _getTopRatedMovie;

  TopRatedMovieListBloc(this._getTopRatedMovie)
      : super(TopRatedMovieListInitial());

  @override
  Stream<TopRatedMovieListState> mapEventToState(
    TopRatedMovieListEvent event,
  ) async* {
    if (event is TopRatedMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await _getTopRatedMovie.call(null);
      yield movies.fold(
        (ApiError l) => TopRatedMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            TopRatedMovieListSuccess(movies: r),
      );
    }
  }
}
