// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db/di/get_di.dart';
import 'package:movie_db/domain/entities/ui_params.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/features/movies/presentation/widgets/widgets.dart';

class MovieDiscoverPage extends StatefulWidget {
  const MovieDiscoverPage({Key key}) : super(key: key);

  @override
  _MovieDiscoverPageState createState() => _MovieDiscoverPageState();
}

class _MovieDiscoverPageState extends State<MovieDiscoverPage> {
  MovieCarouselBloc movieCarouselBloc;
  TopRatedMovieListBloc topRatedMovieListBloc;
  UpcomingMovieListBloc upcomingMovieListBloc;
  NowPlayingMovieListBloc nowPlayingMovieListBloc;
  PopularMovieListBloc popularMovieListBloc;
  MovieCarouselCardBloc movieCarouselCardBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    topRatedMovieListBloc = getItInstance<TopRatedMovieListBloc>();
    upcomingMovieListBloc = getItInstance<UpcomingMovieListBloc>();
    nowPlayingMovieListBloc = getItInstance<NowPlayingMovieListBloc>();
    popularMovieListBloc = getItInstance<PopularMovieListBloc>();
    movieCarouselCardBloc = getItInstance<MovieCarouselCardBloc>();

    movieCarouselBloc.add(const MovieCarouselLoadEvent());
    topRatedMovieListBloc.add(TopRatedMovieListLoadEvent());
    upcomingMovieListBloc.add(UpcomingMovieListLoadEvent());
    nowPlayingMovieListBloc.add(NowPlayingMovieListLoadEvent());
    popularMovieListBloc.add(PopularMovieListLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
    topRatedMovieListBloc.close();
    upcomingMovieListBloc.close();
    nowPlayingMovieListBloc.close();
    popularMovieListBloc.close();
    movieCarouselCardBloc.close();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<MovieCarouselBloc>(
            create: (BuildContext context) => movieCarouselBloc,
          ),
          BlocProvider<TopRatedMovieListBloc>(
            create: (BuildContext context) => topRatedMovieListBloc,
          ),
          BlocProvider<UpcomingMovieListBloc>(
            create: (BuildContext context) => upcomingMovieListBloc,
          ),
          BlocProvider<UpcomingMovieListBloc>(
            create: (BuildContext context) => upcomingMovieListBloc,
          ),
          BlocProvider<NowPlayingMovieListBloc>(
            create: (BuildContext context) => nowPlayingMovieListBloc,
          ),
          BlocProvider<PopularMovieListBloc>(
            create: (BuildContext context) => popularMovieListBloc,
          ),
          BlocProvider<MovieCarouselCardBloc>(
            create: (BuildContext context) => movieCarouselCardBloc,
          ),
        ],
        child: Scaffold(
          body: ListView(
            children: [
              const MovieCarousel(),
              const SizedBox(height: 10),
              PopularMovieListView(onTap: (content) => onTap(context, content)),
              NowPlayingMovieListView(
                  onTap: (content) => onTap(context, content)),
              UpcomingMovieListView(
                  onTap: (content) => onTap(context, content)),
              TopRatedMovieListView(
                  onTap: (content) => onTap(context, content)),
            ],
          ),
        ),
      );

  void onTap(BuildContext context, UIParam c) =>
      BlocProvider.of<MovieRouteBloc>(context)
          .add(MovieRouteToDetailsPageEvent(c));
}
