// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/models.dart';
import 'package:movie_db/features/movies/data/models/movie_models.dart';
import 'movie_data_source.dart';

class TMDBMovieDataSource implements MovieDataSource {
  final Dio _dio;

  TMDBMovieDataSource(this._dio);

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
    final Response<Map<String, dynamic>> response = await _dio.get(
      movieUrl,
      queryParameters: <String, dynamic>{
        RequestParams.apiKey: ApiConstants.apiKey,
        RequestParams.language: 'en-US',
        RequestParams.page: 1,
      },
    );
    // print('$movieUrl ${response.data['results'].length}');
    throwExceptionIfNotSuccess(response);

    final PaginatedResponse<MovieDetails> movieResponse =
        PaginatedResponse<MovieDetails>.fromJson(
      response.data,
      (dynamic map) => MovieDetails.fromMap(map),
    );
    return movieResponse;
  }

  @override
  Future<MovieDetails> getMovieDetail(int id) async {
    final Response<Map<String, dynamic>> response = await _dio.get(
      '${ApiConstants.getMovieBaseUrl}/$id',
      queryParameters: <String, dynamic>{
        RequestParams.apiKey: ApiConstants.apiKey,
        RequestParams.language: 'en-US',
        RequestParams.page: 1,
        RequestParams.appendToResponse: AppendToResponseParam.images,
        RequestParams.includeImageLanguage: 'en,null',
      },
    );
    throwExceptionIfNotSuccess(response);
    final MovieDetails movieDetails = MovieDetails.fromMap(response.data);
    return movieDetails;
  }
}
