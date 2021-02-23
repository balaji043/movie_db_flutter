// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/features/movies/data/models/movie_details.dart';

abstract class MovieRepository {
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getNowPlayingMovies();
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>> getPopularMovies();
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>> getTopRatedMovies();
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>> getUpcomingMovies();
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>> getTrendingMovies();
}
