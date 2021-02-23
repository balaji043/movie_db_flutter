// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/features/movies/data/datasources/movie_data_source.dart';
import 'package:movie_db/features/movies/data/models/movie_details.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getNowPlayingMovies() async {
    try {
      final PaginatedResponse<MovieDetails> movieResult =
          await dataSource.getNowPlayingMovies();
      return Right<ApiError, PaginatedResponse<MovieDetails>>(movieResult);
    } on Exception catch (e) {
      return Left<ApiError, PaginatedResponse<MovieDetails>>(ApiError('$e'));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getPopularMovies() async {
    try {
      final PaginatedResponse<MovieDetails> movieResult =
          await dataSource.getPopularMovies();
      return Right<ApiError, PaginatedResponse<MovieDetails>>(movieResult);
    } on Exception catch (e) {
      return Left<ApiError, PaginatedResponse<MovieDetails>>(ApiError('$e'));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getTopRatedMovies() async {
    try {
      final PaginatedResponse<MovieDetails> movieResult =
          await dataSource.getTopRatedMovies();
      return Right<ApiError, PaginatedResponse<MovieDetails>>(movieResult);
    } on Exception catch (e) {
      return Left<ApiError, PaginatedResponse<MovieDetails>>(ApiError('$e'));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getUpcomingMovies() async {
    try {
      final PaginatedResponse<MovieDetails> movieResult =
          await dataSource.getUpcomingMovies();
      return Right<ApiError, PaginatedResponse<MovieDetails>>(movieResult);
    } on Exception catch (e) {
      return Left<ApiError, PaginatedResponse<MovieDetails>>(ApiError('$e'));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getTrendingMovies() async {
    try {
      final PaginatedResponse<MovieDetails> movieResult =
          await dataSource.getTrendingMovies();
      return Right<ApiError, PaginatedResponse<MovieDetails>>(movieResult);
    } on Exception catch (e) {
      return Left<ApiError, PaginatedResponse<MovieDetails>>(ApiError('$e'));
    }
  }

  @override
  Future<Either<ApiError, MovieDetails>> getMovieDetails(int id) async {
    try {
      final movieDetails = await dataSource.getMovieDetail(id);
      return Right(movieDetails);
    } on Exception catch (e) {
      return Left(ApiError('$e'));
    }
  }
}
