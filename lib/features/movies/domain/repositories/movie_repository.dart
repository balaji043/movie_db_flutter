import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieEntity>> getNowPlayingMovies();
  Future<Either<Failure, MovieEntity>> getPopularMovies();
  Future<Either<Failure, MovieEntity>> getTopRatedMovies();
  Future<Either<Failure, MovieEntity>> getUpcomingMovies();
}
