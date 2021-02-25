// Project imports:
import 'package:movie_db/data/models/models.dart';
import 'package:movie_db/features/movies/data/models/movie_models.dart';

abstract class MovieDataSource {
  Future<PaginatedResponse<MovieDetails>> getNowPlayingMovies();
  Future<PaginatedResponse<MovieDetails>> getPopularMovies();
  Future<PaginatedResponse<MovieDetails>> getTopRatedMovies();
  Future<PaginatedResponse<MovieDetails>> getUpcomingMovies();
  Future<PaginatedResponse<MovieDetails>> getTrendingMovies();
  Future<MovieDetails> getMovieDetail(int id);
}
