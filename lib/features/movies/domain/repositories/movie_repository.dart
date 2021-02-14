// Package imports:
import 'package:dartz/dartz.dart';
import 'package:movie_db/data/models/tmdb/sections/core.dart';

// Project imports:
import '../../../../core/failures.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, PaginatedResponse<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, PaginatedResponse<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, PaginatedResponse<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, PaginatedResponse<MovieEntity>>> getUpcomingMovies();
}
