import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/features/movies/data/models/movie_details.dart';
import 'package:movie_db/features/movies/domain/entities/movie_params.dart';
import 'package:movie_db/features/movies/domain/usecases/usecases.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  MovieDetailsBloc(this.getMovieDetails) : super(MovieDetailsInitial());

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<ApiError, MovieDetails> eitherResponse =
          await getMovieDetails(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => MovieDetailsError(),
        (r) => MovieDetailsLoaded(r),
      );
    }
  }
}
