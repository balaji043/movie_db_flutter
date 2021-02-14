// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../core/failures.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieEntity>> getNowPlayingMovies();
  Future<Either<Failure, MovieEntity>> getPopularMovies();
  Future<Either<Failure, MovieEntity>> getTopRatedMovies();
  Future<Either<Failure, MovieEntity>> getUpcomingMovies();
}
