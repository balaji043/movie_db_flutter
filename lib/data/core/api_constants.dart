import 'package:dio/dio.dart';

class ApiConstants {
  ApiConstants._();

  static const tMDBBaseUrlV3 = "https://api.themoviedb.org/3";
  static const apiKey = String.fromEnvironment("api_key");

  /* Base URL start */
  static const _getMovieBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/movie';
  static const _getTrendingBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/trending';
  /* Base URL end */
  /* Movie URL start */
  static const getNowPlayingMoviesUrl = '$_getMovieBaseUrl/now_playing';
  static const getPopularMoviesUrl = '$_getMovieBaseUrl/popular';
  static const getTopRatedMoviesUrl = '$_getMovieBaseUrl/top_rated';
  static const getUpcomingMoviesUrl = '$_getMovieBaseUrl/upcoming';
  static const getTrendingMoviesUrl =
      '$_getTrendingBaseUrl/${TrendingMediaType.movie}/${TrendingTimeWindow.day}';
  /* Movie URL end */

  static const params = {
    'api_key': apiKey,
    'language': 'en-US',
    'page': 1,
  };
}

void printException(dynamic error, StackTrace stackTrace) {
  // print("Exception occured: $error stackTrace: $stackTrace");
}

void throwExceptionIfNotSuccess(Response response) {
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
}

class TrendingTimeWindow {
  static const day = 'day';
  static const week = 'week';
}

class TrendingMediaType {
  static const all = 'all';
  static const movie = 'movie';
  static const tv = 'tv';
  static const person = 'person';
}
