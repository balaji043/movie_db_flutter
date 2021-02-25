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

part 'upcoming_movie_list_event.dart';
part 'upcoming_movie_list_state.dart';

class UpcomingMovieListBloc
    extends Bloc<UpcomingMovieListEvent, UpcomingMovieListState> {
  final GetUpcomingMovies _getUpcomingMovie;

  UpcomingMovieListBloc(this._getUpcomingMovie)
      : super(UpcomingMovieListInitial());

  @override
  Stream<UpcomingMovieListState> mapEventToState(
    UpcomingMovieListEvent event,
  ) async* {
    if (event is UpcomingMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await _getUpcomingMovie.call(null);
      yield movies.fold(
        (ApiError l) => UpcomingMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            UpcomingMovieListSuccess(movies: r),
      );
    }
  }
}
