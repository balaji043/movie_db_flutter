// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/themes/theme_text.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'TMDB App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: AppColor.black,
          ),
          backgroundColor: AppColor.black,
          scaffoldBackgroundColor: AppColor.black,
          textTheme: ThemeText.getTextTheme(),
        ),
        home: const HomeScreen(),
      );
}
