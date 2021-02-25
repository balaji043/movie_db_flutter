// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:movie_db/features/movies/movies_di.dart';

Future<void> init() async {
  GetIt.I.registerLazySingleton<Dio>(
    () => Dio(),
  );
  await initMovieDependencies();
}
