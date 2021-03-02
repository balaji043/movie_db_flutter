// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiConstants {
  ApiConstants._();

  static const String tMDBBaseUrlV3 = 'https://api.themoviedb.org/3';
  static const String tmdbImageBaseUrlV3 = 'https://image.tmdb.org/t/p';

  static const String apiKey = '28865138e4e85636c645f77389eac900';
  //String.fromEnvironment('api_key');

  /* Base URL start */
  static const String getMovieBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/movie';
  static const String _getTrendingBaseUrl =
      '${ApiConstants.tMDBBaseUrlV3}/trending';
  /* Base URL end */
  /* Movie URL start */
  static const String getNowPlayingMoviesUrl = '$getMovieBaseUrl/now_playing';
  static const String getPopularMoviesUrl = '$getMovieBaseUrl/popular';
  static const String getTopRatedMoviesUrl = '$getMovieBaseUrl/top_rated';
  static const String getUpcomingMoviesUrl = '$getMovieBaseUrl/upcoming';
  static const String getTrendingMoviesUrl =
      '$_getTrendingBaseUrl/${TrendingMediaType.movie}/${TrendingTimeWindow.day}';
  /* Movie URL end */

}

void printException(dynamic error, StackTrace stackTrace) {
  // ignore: avoid_print
  print('Exception occured: $error stackTrace: $stackTrace');
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

String getBDUrl(String path, Size size) =>
    '${ApiConstants.tmdbImageBaseUrlV3}/w${size.width.toInt()}/$path';

class RequestParams {
  static const String language = 'language';
  static const String appendToResponse = 'append_to_response';
  static const String page = 'page';
  static const String apiKey = 'api_key';
  static const String includeImageLanguage = 'include_image_language';
}

class AppendToResponseParam {
  static const String images = 'images';
}
