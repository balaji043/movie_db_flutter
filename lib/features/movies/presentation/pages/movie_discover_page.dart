// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:movie_db/domain/entities/entities.dart';
import 'package:movie_db/features/movies/domain/entities/movie_entities.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/features/movies/presentation/widgets/movie_widgets.dart';

class MovieDiscoverPage extends StatefulWidget {
  const MovieDiscoverPage({Key key}) : super(key: key);

  @override
  _MovieDiscoverPageState createState() => _MovieDiscoverPageState();
}

class _MovieDiscoverPageState extends State<MovieDiscoverPage> {
  @override
  void initState() {
    super.initState();

    GetIt.I<MovieCarouselBloc>().add(const MovieCarouselLoadEvent());
    GetIt.I<TopRatedMovieListBloc>().add(TopRatedMovieListLoadEvent());
    GetIt.I<UpcomingMovieListBloc>().add(UpcomingMovieListLoadEvent());
    GetIt.I<NowPlayingMovieListBloc>().add(NowPlayingMovieListLoadEvent());
    GetIt.I<PopularMovieListBloc>().add(PopularMovieListLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: <Widget>[
            const MovieCarousel(),
            const SizedBox(height: 10),
            PopularMovieListView(
                onTap: (MovieEntity content) => onTap(context, content)),
            NowPlayingMovieListView(
                onTap: (MovieEntity content) => onTap(context, content)),
            UpcomingMovieListView(
                onTap: (MovieEntity content) => onTap(context, content)),
            TopRatedMovieListView(
                onTap: (MovieEntity content) => onTap(context, content)),
          ],
        ),
      );

  void onTap(BuildContext context, UIParam c) =>
      BlocProvider.of<MovieRouteBloc>(context)
          .add(MovieRouteToDetailsPageEvent(c));
}
