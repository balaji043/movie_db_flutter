part of 'movie_usecases.dart';

class GetMovieDetails extends UseCase<MovieDetails, MovieParams> {
  final MovieRepository repository;

  GetMovieDetails(this.repository);

  @override
  Future<Either<ApiError, MovieDetails>> call(MovieParams params) =>
      repository.getMovieDetails(params.id);
}
