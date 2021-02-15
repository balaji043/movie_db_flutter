import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/data/models/movie_details.dart';

abstract class MovieDataSource {
  Future<PaginatedResponse<MovieDetails>> getNowPlayingMovies();
  Future<PaginatedResponse<MovieDetails>> getPopularMovies();
  Future<PaginatedResponse<MovieDetails>> getTopRatedMovies();
  Future<PaginatedResponse<MovieDetails>> getUpcomingMovies();
  Future<PaginatedResponse<MovieDetails>> getTrendingMovies();
}
