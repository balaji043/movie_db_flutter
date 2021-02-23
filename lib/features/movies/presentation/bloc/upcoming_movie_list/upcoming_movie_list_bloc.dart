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
import 'package:movie_db/features/movies/domain/usecases/get_upcoming_movies.dart';

part 'upcoming_movie_list_event.dart';
part 'upcoming_movie_list_state.dart';

class UpcomingMovieListBloc
    extends Bloc<UpcomingMovieListEvent, UpcomingMovieListState> {
  final GetUpcomingMovies getUpcomingMovie;

  UpcomingMovieListBloc(this.getUpcomingMovie)
      : super(UpcomingMovieListInitial());

  @override
  Stream<UpcomingMovieListState> mapEventToState(
    UpcomingMovieListEvent event,
  ) async* {
    if (event is UpcomingMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await getUpcomingMovie.call(null);
      yield movies.fold(
        (ApiError l) => UpcomingMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            UpcomingMovieListSuccess(movies: r),
      );
    }
  }
}
