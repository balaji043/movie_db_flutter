import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/di/get_di.dart';
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
  MovieRouteBloc movieRouteBloc;
  MovieDetailsBloc movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    movieRouteBloc = getItInstance<MovieRouteBloc>();
    movieDetailsBloc = getItInstance<MovieDetailsBloc>();
  }

  @override
  void dispose() {
    movieRouteBloc.close();
    movieDetailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<MovieRouteBloc>(
            create: (BuildContext context) => movieRouteBloc,
          ),
          BlocProvider<MovieDetailsBloc>(
            create: (BuildContext context) => movieDetailsBloc,
          ),
        ],
        child: BlocBuilder<MovieRouteBloc, MovieRouteState>(
          builder: (context, state) {
            if (state is MovieRouteToDetailsPageState) {
              return const MovieDetailsPage();
            } else {
              return const MovieMainPage();
            }
          },
        ),
      );
}
