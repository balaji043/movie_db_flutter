import 'package:dartz/dartz.dart';
import 'package:movie_db/core/failures.dart';
import 'package:movie_db/data/models/tmdb/sections/core.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_db/features/movies/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository movieRepository;

  GetNowPlayingMovies({
    this.movieRepository,
  });

  Future<Either<Failure, PaginatedResponse<MovieEntity>>> execute() async =>
      await movieRepository.getNowPlayingMovies();
}
