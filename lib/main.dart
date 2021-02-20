// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:movie_db/di/get_di.dart' as get_di;
import 'package:movie_db/presentation/movie_app.dart';
// Package imports:
import 'package:pedantic/pedantic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(get_di.init());
  runApp(const MovieApp());
}
