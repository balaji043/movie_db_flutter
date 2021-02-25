import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/features/movies/presentation/bloc/movie_route/movie_route_bloc.dart';

import 'movie_details_page.dart';
import 'movie_main_page.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieRouteBloc, MovieRouteState>(
        builder: (BuildContext context, MovieRouteState state) {
          if (state is MovieRouteToDetailsPageState) {
            return const MovieDetailsPage();
          } else {
            return const MovieMainPage();
          }
        },
      );
}
