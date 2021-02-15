// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:movie_db/data/data_source/movie_data_source.dart';
import 'package:movie_db/data/data_source/tmdb_movie_data_source.dart';
import 'package:movie_db/domain/repositories/movie_repository.dart';
import 'package:movie_db/domain/repositories/movie_repository_impl.dart';
import 'package:movie_db/domain/use_cases/get_now_playing_movies.dart';
import 'package:movie_db/domain/use_cases/get_popular_movies.dart';
import 'package:movie_db/domain/use_cases/get_top_rated_movies.dart';
import 'package:movie_db/domain/use_cases/get_trending_movies.dart';
import 'package:movie_db/domain/use_cases/get_upcoming_movies.dart';
import 'package:movie_db/presentation/bloc/movie_carousel/movie_carousel_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance.registerLazySingleton<MovieDataSource>(
      () => TMDBMovieDataSource(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetNowPlayingMovies>(
      () => GetNowPlayingMovies(getItInstance()));
  getItInstance.registerLazySingleton<GetPopularMovies>(
      () => GetPopularMovies(getItInstance()));
  getItInstance.registerLazySingleton<GetTopRatedMovies>(
      () => GetTopRatedMovies(getItInstance()));
  getItInstance.registerLazySingleton<GetUpcomingMovies>(
      () => GetUpcomingMovies(getItInstance()));
  getItInstance.registerLazySingleton<GetTrendingMovies>(
      () => GetTrendingMovies(getItInstance()));

  getItInstance.registerLazySingleton<MovieCarouselBloc>(
      () => MovieCarouselBloc(getItInstance()));
}
