import 'package:movie_db/data/data_source/movie_data_source.dart';
import 'package:movie_db/data/models/movie_details.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_db/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getNowPlayingMovies() async {
    try {
      final movieResult = await dataSource.getNowPlayingMovies();
      return Right(movieResult);
    } catch (e) {
      return Left(ApiError("$e"));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getPopularMovies() async {
    try {
      final movieResult = await dataSource.getNowPlayingMovies();
      return Right(movieResult);
    } catch (e) {
      return Left(ApiError("$e"));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getTopRatedMovies() async {
    try {
      final movieResult = await dataSource.getNowPlayingMovies();
      return Right(movieResult);
    } catch (e) {
      return Left(ApiError("$e"));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getUpcomingMovies() async {
    try {
      final movieResult = await dataSource.getNowPlayingMovies();
      return Right(movieResult);
    } catch (e) {
      return Left(ApiError("$e"));
    }
  }

  @override
  Future<Either<ApiError, PaginatedResponse<MovieDetails>>>
      getTrendingMovies() async {
    try {
      final movieResult = await dataSource.getTrendingMovies();
      return Right(movieResult);
    } catch (e) {
      return Left(ApiError("$e"));
    }
  }
}
