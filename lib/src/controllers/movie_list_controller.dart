// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/get.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

const String getMovieBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/movie';
const String getNowPlayingMoviesUrl = '$getMovieBaseUrl/now_playing';
const String getPopularMoviesUrl = '$getMovieBaseUrl/popular';
const String getTopRatedMoviesUrl = '$getMovieBaseUrl/top_rated';
const String getUpcomingMoviesUrl = '$getMovieBaseUrl/upcoming';

class MovieListController extends GetxController {
  final dios.Dio _dio = dios.Dio();

  final RxList<MovieEntity> nowPlayingMovies = <MovieEntity>[].obs;
  final RxList<MovieEntity> popularMovies = <MovieEntity>[].obs;
  final RxList<MovieEntity> topRatedMovies = <MovieEntity>[].obs;
  final RxList<MovieEntity> upcomingMovies = <MovieEntity>[].obs;

  @override
  void onInit() {
    _getNowPlayingMovies();
    _getPopularMovies();
    _getTopRatedMovies();
    _getUpcomingMovies();
    super.onInit();
  }

  Future<void> _getNowPlayingMovies() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getMoviesByUrl(getNowPlayingMoviesUrl);
    nowPlayingMovies
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<void> _getPopularMovies() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getMoviesByUrl(getPopularMoviesUrl);
    popularMovies
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<void> _getTopRatedMovies() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getMoviesByUrl(getTopRatedMoviesUrl);
    topRatedMovies
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<void> _getUpcomingMovies() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getMoviesByUrl(getUpcomingMoviesUrl);
    upcomingMovies
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<PaginatedResponse<MovieEntity>> _getMoviesByUrl(
      String movieUrl) async {
    try {
      final dios.Response<Map<String, dynamic>> response = await _dio.get(
        movieUrl,
        queryParameters: ApiConstants.params,
      );
      final PaginatedResponse<MovieEntity> movieResponse =
          PaginatedResponse<MovieEntity>.fromJson(
        response.data,
        (Map<String, dynamic> map) => MovieEntity.fromMap(map),
      );
      return movieResponse;
    } on Exception catch (error, stackTrace) {
      printException(error, stackTrace);
    }
    return Future<PaginatedResponse<MovieEntity>>.value(
      PaginatedResponse<MovieEntity>(
        results: List<MovieEntity>.empty(),
      ),
    );
  }
}
