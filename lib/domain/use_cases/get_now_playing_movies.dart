// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:movie_db/core/failures.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/domain/entities/no_params.dart';
import 'package:movie_db/domain/repositories/movie_repository.dart';
import 'package:movie_db/domain/use_cases/usecase.dart';

class GetNowPlayingMovies implements UseCase<PaginatedResponse, NoParams> {
  final MovieRepository movieRepository;

  GetNowPlayingMovies({
    this.movieRepository,
  });

  @override
  Future<Either<Failure, PaginatedResponse<MovieEntity>>> call(
    void params,
  ) async =>
      await movieRepository.getNowPlayingMovies();
}
