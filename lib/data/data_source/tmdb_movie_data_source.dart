// Package imports:
import 'package:dio/dio.dart';
// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/data_source/movie_data_source.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/data/models/movie_details.dart';

class TMDBMovieDataSource implements MovieDataSource {
  final Dio dio;

  TMDBMovieDataSource(this.dio);

  @override
  Future<PaginatedResponse<MovieDetails>> getNowPlayingMovies() =>
      _getMoviesByUrl(
        ApiConstants.getNowPlayingMoviesUrl,
      );

  @override
  Future<PaginatedResponse<MovieDetails>> getPopularMovies() => _getMoviesByUrl(
        ApiConstants.getPopularMoviesUrl,
      );

  @override
  Future<PaginatedResponse<MovieDetails>> getTopRatedMovies() =>
      _getMoviesByUrl(
        ApiConstants.getTopRatedMoviesUrl,
      );

  @override
  Future<PaginatedResponse<MovieDetails>> getUpcomingMovies() =>
      _getMoviesByUrl(
        ApiConstants.getUpcomingMoviesUrl,
      );

  @override
  Future<PaginatedResponse<MovieDetails>> getTrendingMovies() =>
      _getMoviesByUrl(
        ApiConstants.getTrendingMoviesUrl,
      );

  Future<PaginatedResponse<MovieDetails>> _getMoviesByUrl(
    String movieUrl,
  ) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.get(
        movieUrl,
        queryParameters: ApiConstants.params,
      );
      // print('$movieUrl ${response.data['results'].length}');
      throwExceptionIfNotSuccess(response);

      final PaginatedResponse<MovieDetails> movieResponse =
          PaginatedResponse<MovieDetails>.fromJson(
        response.data,
        (dynamic map) => MovieDetails.fromJson(map),
      );
      return movieResponse;
    } on Exception catch (error, stackTrace) {
      printException(error, stackTrace);
    }
    return Future<PaginatedResponse<MovieDetails>>.value(
      PaginatedResponse<MovieDetails>(
        results: List<MovieDetails>.empty(),
      ),
    );
  }
}
