// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:movie_db/features/movies/data/datasources/movie_data_source.dart';
import 'package:movie_db/features/movies/data/datasources/tmdb_movie_data_source.dart';
import 'package:movie_db/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_db/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_db/features/movies/domain/usecases/movie_usecases.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';

final GetIt getItInstance = GetIt.I;

Future<void> init() async {
  getItInstance.registerLazySingleton<Dio>(
    () => Dio(),
  );
  await initMovieDependencies();
}

Future<void> initMovieDependencies() async {
  getItInstance
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
    ..registerLazySingleton<GetMovieDetails>(
      () => GetMovieDetails(getItInstance()),
    )
    ..registerLazySingleton<MovieCarouselBloc>(
      () => MovieCarouselBloc(
        getItInstance(),
        getItInstance(),
      ),
    )
    ..registerLazySingleton<MovieDetailsBloc>(
      () => MovieDetailsBloc(getItInstance()),
    )
    ..registerLazySingleton<MovieCarouselCardBloc>(
      () => MovieCarouselCardBloc(),
    )
    ..registerLazySingleton<TopRatedMovieListBloc>(
      () => TopRatedMovieListBloc(getItInstance()),
    )
    ..registerLazySingleton<UpcomingMovieListBloc>(
      () => UpcomingMovieListBloc(getItInstance()),
    )
    ..registerLazySingleton<NowPlayingMovieListBloc>(
      () => NowPlayingMovieListBloc(getItInstance()),
    )
    ..registerLazySingleton<PopularMovieListBloc>(
      () => PopularMovieListBloc(getItInstance()),
    )
    ..registerLazySingleton<MovieRouteBloc>(
      () => MovieRouteBloc(getItInstance()),
    );
}
