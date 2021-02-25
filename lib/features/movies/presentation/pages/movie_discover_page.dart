// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db/di/get_di.dart';
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

    getItInstance<MovieCarouselBloc>().add(const MovieCarouselLoadEvent());
    getItInstance<TopRatedMovieListBloc>().add(TopRatedMovieListLoadEvent());
    getItInstance<UpcomingMovieListBloc>().add(UpcomingMovieListLoadEvent());
    getItInstance<NowPlayingMovieListBloc>()
        .add(NowPlayingMovieListLoadEvent());
    getItInstance<PopularMovieListBloc>().add(PopularMovieListLoadEvent());
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
