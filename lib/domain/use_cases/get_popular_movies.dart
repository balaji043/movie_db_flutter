// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/domain/entities/no_params.dart';
import 'package:movie_db/domain/repositories/movie_repository.dart';
import 'package:movie_db/domain/use_cases/usecase.dart';

class GetPopularMovies
    implements UseCase<PaginatedResponse<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetPopularMovies(this.movieRepository);

  @override
  Future<Either<ApiError, PaginatedResponse<MovieEntity>>> call(
    void params,
  ) =>
      movieRepository.getPopularMovies();
}
