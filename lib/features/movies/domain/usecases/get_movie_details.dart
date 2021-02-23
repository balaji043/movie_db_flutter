import 'package:dartz/dartz.dart';
import 'package:movie_db/domain/entities/api_error.dart';
import 'package:movie_db/domain/use_cases/usecase.dart';
import 'package:movie_db/features/movies/data/models/movie_details.dart';
import 'package:movie_db/features/movies/domain/entities/movie_params.dart';
import 'package:movie_db/features/movies/domain/repositories/movie_repository.dart';

class GetMovieDetails extends UseCase<MovieDetails, MovieParams> {
  final MovieRepository repository;

  GetMovieDetails(this.repository);

  @override
  Future<Either<ApiError, MovieDetails>> call(MovieParams params) =>
      repository.getMovieDetails(params.id);
}
