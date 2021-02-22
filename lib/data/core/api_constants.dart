// Package imports:
import 'package:dio/dio.dart';

class ApiConstants {
  ApiConstants._();

  static const String tMDBBaseUrlV3 = 'https://api.themoviedb.org/3';
  static const String tmdbImageBaseUrlV3 = 'https://image.tmdb.org/t/p/w1280';
  static const String tmdbImagePosterBaseUrlV3 =
      'https://image.tmdb.org/t/p/w154';

  static const String apiKey = String.fromEnvironment('api_key');

  /* Base URL start */
  static const String _getMovieBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/movie';
  static const String _getTrendingBaseUrl =
      '${ApiConstants.tMDBBaseUrlV3}/trending';
  /* Base URL end */
  /* Movie URL start */
  static const String getNowPlayingMoviesUrl = '$_getMovieBaseUrl/now_playing';
  static const String getPopularMoviesUrl = '$_getMovieBaseUrl/popular';
  static const String getTopRatedMoviesUrl = '$_getMovieBaseUrl/top_rated';
  static const String getUpcomingMoviesUrl = '$_getMovieBaseUrl/upcoming';
  static const String getTrendingMoviesUrl =
      '$_getTrendingBaseUrl/${TrendingMediaType.movie}/${TrendingTimeWindow.day}';
  /* Movie URL end */

  static const Map<String, dynamic> params = <String, dynamic>{
    'api_key': apiKey,
    'language': 'en-US',
    'page': 1,
  };
}

void printException(dynamic error, StackTrace stackTrace) {
  // print("Exception occured: $error stackTrace: $stackTrace");
}

void throwExceptionIfNotSuccess(Response<dynamic> response) {
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
}

class TrendingTimeWindow {
  static const String day = 'day';
  static const String week = 'week';
}

class TrendingMediaType {
  static const String all = 'all';
  static const String movie = 'movie';
  static const String tv = 'tv';
  static const String person = 'person';
}
