// Package imports:
import 'package:dio/dio.dart' as dios;
import 'package:get/get.dart';
import 'package:movie_db/data/core/api_constants.dart';
import 'package:movie_db/data/models/core.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

// Project imports:

const String getTVShowsBaseUrl = '${ApiConstants.TMDBBaseUrlV3}/tv';

const String getPopularTVShowsUrl = '$getTVShowsBaseUrl/popular';
const String getAiringTodayTVShowsUrl = '$getTVShowsBaseUrl/airing_today';
const String getOnTheAirTVShowsUrl = '$getTVShowsBaseUrl/on_the_air';
const String getTopRatedTVShowsUrl = '$getTVShowsBaseUrl/top_rated';

class TVShowsListController extends GetxController {
  final dios.Dio _dio = dios.Dio();

  var popularTVShows = <MovieEntity>[].obs;
  var airingTodayTVShows = <MovieEntity>[].obs;
  var onTheAirTVShows = <MovieEntity>[].obs;
  var topRatedTVShows = <MovieEntity>[].obs;

  @override
  void onInit() {
    _getPopularTVShowsUrl();
    _getAiringTodayTVShowsUrl();
    _getOnTVShowsUrl();
    _getTopRatedTVShowsUrl();
    super.onInit();
  }

  void _getPopularTVShowsUrl() async {
    var getMoviesByUrl = await _getTVShowsByUrl(getPopularTVShowsUrl);
    popularTVShows.clear();
    popularTVShows.addAll(getMoviesByUrl.results);
  }

  void _getAiringTodayTVShowsUrl() async {
    var getMoviesByUrl = await _getTVShowsByUrl(getAiringTodayTVShowsUrl);
    airingTodayTVShows.clear();
    airingTodayTVShows.addAll(getMoviesByUrl.results);
  }

  void _getOnTVShowsUrl() async {
    var getMoviesByUrl = await _getTVShowsByUrl(getOnTheAirTVShowsUrl);
    onTheAirTVShows.clear();
    onTheAirTVShows.addAll(getMoviesByUrl.results);
  }

  void _getTopRatedTVShowsUrl() async {
    var getMoviesByUrl = await _getTVShowsByUrl(getTopRatedTVShowsUrl);
    topRatedTVShows.clear();
    topRatedTVShows.addAll(getMoviesByUrl.results);
  }

  Future<PaginatedResponse<MovieEntity>> _getTVShowsByUrl(
      String tvShowUrl) async {
    try {
      dios.Response response = await _dio.get(
        tvShowUrl,
        queryParameters: ApiConstants.params,
      );
      print('$tvShowUrl ${response.data['results'].length}');
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
