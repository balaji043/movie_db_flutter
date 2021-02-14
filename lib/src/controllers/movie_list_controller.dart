// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/get.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

// Project imports:

const String getMovieBaseUrl = '${ApiConstants.TMDBBaseUrlV3}/movie';
const String getNowPlayingMoviesUrl = '$getMovieBaseUrl/now_playing';
const String getPopularMoviesUrl = '$getMovieBaseUrl/popular';
const String getTopRatedMoviesUrl = '$getMovieBaseUrl/top_rated';
const String getUpcomingMoviesUrl = '$getMovieBaseUrl/upcoming';

class MovieListController extends GetxController {
  final dios.Dio _dio = dios.Dio();

  var nowPlayingMovies = <MovieEntity>[].obs;
  var popularMovies = <MovieEntity>[].obs;
  var topRatedMovies = <MovieEntity>[].obs;
  var upcomingMovies = <MovieEntity>[].obs;

  @override
  void onInit() {
    _getNowPlayingMovies();
    _getPopularMovies();
    _getTopRatedMovies();
    _getUpcomingMovies();
    super.onInit();
  }

  void _getNowPlayingMovies() async {
    var getMoviesByUrl = await _getMoviesByUrl(getNowPlayingMoviesUrl);
    nowPlayingMovies.clear();
    nowPlayingMovies.addAll(getMoviesByUrl.results);
  }

  void _getPopularMovies() async {
    var getMoviesByUrl = await _getMoviesByUrl(getPopularMoviesUrl);
    popularMovies.clear();
    popularMovies.addAll(getMoviesByUrl.results);
  }

  void _getTopRatedMovies() async {
    var getMoviesByUrl = await _getMoviesByUrl(getTopRatedMoviesUrl);
    topRatedMovies.clear();
    topRatedMovies.addAll(getMoviesByUrl.results);
  }

  void _getUpcomingMovies() async {
    var getMoviesByUrl = await _getMoviesByUrl(getUpcomingMoviesUrl);
    upcomingMovies.clear();
    upcomingMovies.addAll(getMoviesByUrl.results);
  }

  Future<PaginatedResponse<MovieEntity>> _getMoviesByUrl(
      String movieUrl) async {
    try {
      dios.Response response = await _dio.get(
        movieUrl,
        queryParameters: ApiConstants.params,
      );
      var movieResponse = PaginatedResponse<MovieEntity>.fromJson(
        response.data,
        (map) => MovieEntity.fromMap(map),
      );
      return movieResponse;
    } catch (error, stackTrace) {
      printException(error, stackTrace);
    }
    return Future.value(PaginatedResponse<MovieEntity>(results: List.empty()));
  }
}
