import 'package:get_it/get_it.dart';
import 'package:movie_db/features/movies/data/datasources/movie_data_source.dart';
import 'package:movie_db/features/movies/data/datasources/tmdb_movie_data_source.dart';
import 'package:movie_db/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_db/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_db/features/movies/domain/usecases/movie_usecases.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';

Future<void> initMovieDependencies() async {
  await _initDataSourece();
  await _initRepository();
  await _initUseCases();
  await _initBlocs();
}

Future<void> _initBlocs() async => GetIt.I
  ..registerLazySingleton<MovieCarouselBloc>(
    () => MovieCarouselBloc(
      GetIt.I(),
      GetIt.I(),
    ),
  )
  ..registerLazySingleton<MovieDetailsBloc>(
    () => MovieDetailsBloc(GetIt.I()),
  )
  ..registerLazySingleton<MovieCarouselCardBloc>(
    () => MovieCarouselCardBloc(),
  )
  ..registerLazySingleton<TopRatedMovieListBloc>(
    () => TopRatedMovieListBloc(GetIt.I()),
  )
  ..registerLazySingleton<UpcomingMovieListBloc>(
    () => UpcomingMovieListBloc(GetIt.I()),
  )
  ..registerLazySingleton<NowPlayingMovieListBloc>(
    () => NowPlayingMovieListBloc(GetIt.I()),
  )
  ..registerLazySingleton<PopularMovieListBloc>(
    () => PopularMovieListBloc(GetIt.I()),
  )
  ..registerLazySingleton<MovieRouteBloc>(
    () => MovieRouteBloc(GetIt.I()),
  );

Future<void> _initUseCases() async => GetIt.I
  ..registerLazySingleton<GetNowPlayingMovies>(
    () => GetNowPlayingMovies(GetIt.I()),
  )
  ..registerLazySingleton<GetPopularMovies>(
    () => GetPopularMovies(GetIt.I()),
  )
  ..registerLazySingleton<GetTopRatedMovies>(
    () => GetTopRatedMovies(GetIt.I()),
  )
  ..registerLazySingleton<GetUpcomingMovies>(
    () => GetUpcomingMovies(GetIt.I()),
  )
  ..registerLazySingleton<GetTrendingMovies>(
    () => GetTrendingMovies(GetIt.I()),
  )
  ..registerLazySingleton<GetMovieDetails>(
    () => GetMovieDetails(GetIt.I()),
  );

Future<void> _initRepository() async => GetIt.I
  ..registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(GetIt.I()),
  );

Future<void> _initDataSourece() async => GetIt.I
  ..registerLazySingleton<MovieDataSource>(
    () => TMDBMovieDataSource(GetIt.I()),
  );
