part of 'movie_usecases.dart';

class GetTopRatedMovies
    implements UseCase<PaginatedResponse<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetTopRatedMovies(this.movieRepository);

  @override
  Future<Either<ApiError, PaginatedResponse<MovieEntity>>> call(
    void params,
  ) =>
      movieRepository.getTopRatedMovies();
}
