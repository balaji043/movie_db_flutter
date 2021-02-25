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

part 'now_playing_movie_list_event.dart';
part 'now_playing_movie_list_state.dart';

class NowPlayingMovieListBloc
    extends Bloc<NowPlayingMovieListEvent, NowPlayingMovieListState> {
  final GetNowPlayingMovies _getNowPlayingMovie;

  NowPlayingMovieListBloc(this._getNowPlayingMovie)
      : super(NowPlayingMovieListInitial());

  @override
  Stream<NowPlayingMovieListState> mapEventToState(
    NowPlayingMovieListEvent event,
  ) async* {
    if (event is NowPlayingMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await _getNowPlayingMovie.call(null);
      yield movies.fold(
        (ApiError l) => NowPlayingMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            NowPlayingMovieListSuccess(movies: r),
      );
    }
  }
}
