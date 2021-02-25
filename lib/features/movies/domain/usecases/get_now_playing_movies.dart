part of 'movie_usecases.dart';

class GetNowPlayingMovies
    implements UseCase<PaginatedResponse<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetNowPlayingMovies(this.movieRepository);

  @override
  Future<Either<ApiError, PaginatedResponse<MovieEntity>>> call(
    void params,
  ) =>
      movieRepository.getNowPlayingMovies();
}
