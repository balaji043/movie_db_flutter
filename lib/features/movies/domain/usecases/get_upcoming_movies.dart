part of 'movie_usecases.dart';

class GetUpcomingMovies
    implements UseCase<PaginatedResponse<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetUpcomingMovies(this.movieRepository);

  @override
  Future<Either<ApiError, PaginatedResponse<MovieEntity>>> call(
    void params,
  ) =>
      movieRepository.getUpcomingMovies();
}
