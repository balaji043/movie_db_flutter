// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:movie_db/domain/entities/entities.dart';
import 'package:movie_db/features/movies/data/models/movie_models.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entities.dart';
import 'package:movie_db/features/movies/domain/usecases/movie_usecases.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails _getMovieDetails;
  MovieDetailsBloc(this._getMovieDetails) : super(MovieDetailsInitial());

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<ApiError, MovieDetails> eitherResponse =
          await _getMovieDetails(MovieParams(event.movieId));
      yield eitherResponse.fold(
        (ApiError l) => MovieDetailsError(),
        (MovieDetails r) => MovieDetailsLoaded(r),
      );
    }
  }
}
