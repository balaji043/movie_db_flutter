part of 'movie_usecases.dart';

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
