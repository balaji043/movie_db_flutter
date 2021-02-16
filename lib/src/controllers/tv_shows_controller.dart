// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/get.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

const String getTVShowsBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/tv';

const String getPopularTVShowsUrl = '$getTVShowsBaseUrl/popular';
const String getAiringTodayTVShowsUrl = '$getTVShowsBaseUrl/airing_today';
const String getOnTheAirTVShowsUrl = '$getTVShowsBaseUrl/on_the_air';
const String getTopRatedTVShowsUrl = '$getTVShowsBaseUrl/top_rated';

class TVShowsListController extends GetxController {
  final dios.Dio _dio = dios.Dio();

  final RxList<MovieEntity> popularTVShows = <MovieEntity>[].obs;
  final RxList<MovieEntity> airingTodayTVShows = <MovieEntity>[].obs;
  final RxList<MovieEntity> onTheAirTVShows = <MovieEntity>[].obs;
  final RxList<MovieEntity> topRatedTVShows = <MovieEntity>[].obs;

  @override
  void onInit() {
    _getPopularTVShowsUrl();
    _getAiringTodayTVShowsUrl();
    _getOnTVShowsUrl();
    _getTopRatedTVShowsUrl();
    super.onInit();
  }

  Future<void> _getPopularTVShowsUrl() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getTVShowsByUrl(getPopularTVShowsUrl);
    popularTVShows
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<void> _getAiringTodayTVShowsUrl() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getTVShowsByUrl(getAiringTodayTVShowsUrl);
    airingTodayTVShows
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<void> _getOnTVShowsUrl() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getTVShowsByUrl(getOnTheAirTVShowsUrl);
    onTheAirTVShows
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<void> _getTopRatedTVShowsUrl() async {
    final PaginatedResponse<MovieEntity> getMoviesByUrl =
        await _getTVShowsByUrl(getTopRatedTVShowsUrl);
    topRatedTVShows
      ..clear()
      ..addAll(getMoviesByUrl.results);
  }

  Future<PaginatedResponse<MovieEntity>> _getTVShowsByUrl(
      String tvShowUrl) async {
    try {
      final dios.Response<Map<String, dynamic>> response = await _dio.get(
        tvShowUrl,
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
