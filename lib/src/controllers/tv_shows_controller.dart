// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/get.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

// Project imports:

const String getTVShowsBaseUrl = '${ApiConstants.tMDBBaseUrlV3}/tv';

const String getPopularTVShowsUrl = '$getTVShowsBaseUrl/popular';
const String getAiringTodayTVShowsUrl = '$getTVShowsBaseUrl/airing_today';
const String getOnTheAirTVShowsUrl = '$getTVShowsBaseUrl/on_the_air';
const String getTopRatedTVShowsUrl = '$getTVShowsBaseUrl/top_rated';

class TVShowsListController extends GetxController {
  final dios.Dio _dio = dios.Dio();

  final popularTVShows = <MovieEntity>[].obs;
  final airingTodayTVShows = <MovieEntity>[].obs;
  final onTheAirTVShows = <MovieEntity>[].obs;
  final topRatedTVShows = <MovieEntity>[].obs;

  @override
  void onInit() {
    _getPopularTVShowsUrl();
    _getAiringTodayTVShowsUrl();
    _getOnTVShowsUrl();
    _getTopRatedTVShowsUrl();
    super.onInit();
  }

  Future<void> _getPopularTVShowsUrl() async {
    final getMoviesByUrl = await _getTVShowsByUrl(getPopularTVShowsUrl);
    popularTVShows.clear();
    popularTVShows.addAll(getMoviesByUrl.results);
  }

  Future<void> _getAiringTodayTVShowsUrl() async {
    final getMoviesByUrl = await _getTVShowsByUrl(getAiringTodayTVShowsUrl);
    airingTodayTVShows.clear();
    airingTodayTVShows.addAll(getMoviesByUrl.results);
  }

  Future<void> _getOnTVShowsUrl() async {
    final getMoviesByUrl = await _getTVShowsByUrl(getOnTheAirTVShowsUrl);
    onTheAirTVShows.clear();
    onTheAirTVShows.addAll(getMoviesByUrl.results);
  }

  Future<void> _getTopRatedTVShowsUrl() async {
    final getMoviesByUrl = await _getTVShowsByUrl(getTopRatedTVShowsUrl);
    topRatedTVShows.clear();
    topRatedTVShows.addAll(getMoviesByUrl.results);
  }

  Future<PaginatedResponse<MovieEntity>> _getTVShowsByUrl(
      String tvShowUrl) async {
    try {
      final dios.Response response = await _dio.get(
        tvShowUrl,
        queryParameters: ApiConstants.params,
      );
      final movieResponse = PaginatedResponse<MovieEntity>.fromJson(
        response.data as Map<String, dynamic>,
        (map) => MovieEntity.fromMap(map),
      );
      return movieResponse;
    } catch (error, stackTrace) {
      printException(error, stackTrace);
    }
    return Future.value(PaginatedResponse<MovieEntity>(results: List.empty()));
  }
}
