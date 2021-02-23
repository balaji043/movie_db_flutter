import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/di/get_di.dart';
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
  MovieRouteBloc movieRouteBloc;

  @override
  void initState() {
    super.initState();
    movieRouteBloc = getItInstance<MovieRouteBloc>();
  }

  @override
  void dispose() {
    movieRouteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider<MovieRouteBloc>(
          create: (context) => movieRouteBloc,
          child: BlocBuilder<MovieRouteBloc, MovieRouteState>(
            builder: (context, state) {
              if (state is MovieRouteToDetailsPageState) {
                return MovieDetailsPage(
                  movie: state.movie,
                );
              } else {
                return const MovieMainPage();
              }
            },
          ),
        ),
      );
}
