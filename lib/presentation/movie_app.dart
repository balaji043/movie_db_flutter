// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/screen_util.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/themes/theme_text.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      title: 'TMDB App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}
