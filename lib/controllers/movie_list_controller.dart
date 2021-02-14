import 'package:get/get.dart';
import 'package:dio/dio.dart' as dios;
import 'package:movie_db/common/utils/constants.dart';
import 'package:movie_db/data/models/data_content.dart';

const String getMovieBaseUrl = '$mainURL/movie';
const String getNowPlayingMoviesUrl = '$getMovieBaseUrl/now_playing';
const String getPopularMoviesUrl = '$getMovieBaseUrl/popular';
const String getTopRatedMoviesUrl = '$getMovieBaseUrl/top_rated';
const String getUpcomingMoviesUrl = '$getMovieBaseUrl/upcoming';

class MovieListController extends GetxController {
  final dios.Dio _dio = dios.Dio();
  final DataContentType dataContentType = DataContentType.movie;

  var nowPlayingMovies = <DataContent>[].obs;
  var popularMovies = <DataContent>[].obs;
  var topRatedMovies = <DataContent>[].obs;
  var upcomingMovies = <DataContent>[].obs;

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

  Future<MovieListResponse> _getMoviesByUrl(String movieUrl) async {
    try {
      dios.Response response = await _dio.get(
        movieUrl,
        queryParameters: params,
      );
      var movieResponse = MovieListResponse.fromJson(
        response.data,
        dataContentType,
      );
      return movieResponse;
    } catch (error, stackTrace) {
      printException(error, stackTrace);
    }
    return Future.value(MovieListResponse(results: List.empty()));
  }
}
