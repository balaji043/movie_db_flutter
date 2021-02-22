import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/domain/use_cases/get_top_rated_movies.dart';

part 'top_rated_movie_list_event.dart';
part 'top_rated_movie_list_state.dart';

class TopRatedMovieListBloc
    extends Bloc<TopRatedMovieListEvent, TopRatedMovieListState> {
  final GetTopRatedMovies getTopRatedMovie;

  TopRatedMovieListBloc(this.getTopRatedMovie)
      : super(TopRatedMovieListInitial());

  @override
  Stream<TopRatedMovieListState> mapEventToState(
    TopRatedMovieListEvent event,
  ) async* {
    if (event is TopRatedMovieListLoadEvent) {
      final Either<ApiError, PaginatedResponse<MovieEntity>> movies =
          await getTopRatedMovie.call(null);
      yield movies.fold(
        (ApiError l) => TopRatedMovieListError(),
        (PaginatedResponse<MovieEntity> r) =>
            TopRatedMovieListSuccess(movies: r),
      );
    }
  }
}
