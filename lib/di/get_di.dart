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

final GetIt getItInstance = GetIt.I;

Future<void> init() async {
  GetIt.I
    ..registerLazySingleton<Dio>(
      () => Dio(),
    )
    ..registerLazySingleton<MovieDataSource>(
      () => TMDBMovieDataSource(getItInstance()),
    )
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()),
    )
    ..registerLazySingleton<GetNowPlayingMovies>(
      () => GetNowPlayingMovies(getItInstance()),
    )
    ..registerLazySingleton<GetPopularMovies>(
      () => GetPopularMovies(getItInstance()),
    )
    ..registerLazySingleton<GetTopRatedMovies>(
      () => GetTopRatedMovies(getItInstance()),
    )
    ..registerLazySingleton<GetUpcomingMovies>(
      () => GetUpcomingMovies(getItInstance()),
    )
    ..registerLazySingleton<GetTrendingMovies>(
      () => GetTrendingMovies(getItInstance()),
    )
    ..registerLazySingleton<MovieCarouselBloc>(
      () => MovieCarouselBloc(getItInstance()),
    );
}
