import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/di/get_di.dart';
import 'package:movie_db/presentation/bloc/bloc.dart';
import 'package:movie_db/presentation/widgets/carousel_with_list_tile_widget.dart';
import 'package:movie_db/presentation/widgets/content_list_view.dart';

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

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    topRatedMovieListBloc = getItInstance<TopRatedMovieListBloc>();
    upcomingMovieListBloc = getItInstance<UpcomingMovieListBloc>();
    nowPlayingMovieListBloc = getItInstance<NowPlayingMovieListBloc>();
    popularMovieListBloc = getItInstance<PopularMovieListBloc>();

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
        ],
        child: Scaffold(
          body: ListView(
            children: const [
              _MovieCarouselWithListTile(),
              SizedBox(height: 10),
              _PopularMovieListView(),
              _NowPlayingMovieListView(),
              _UpcomingMovieListView(),
              _TopRatedMovieListView(),
            ],
          ),
        ),
      );
}

class _MovieCarouselWithListTile extends StatelessWidget {
  const _MovieCarouselWithListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        builder: (BuildContext context, MovieCarouselState state) {
          if (state is MovieCarouselSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: CarouselWithListTileWidget(
                contents: state.movies.results,
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}

class _PopularMovieListView extends StatelessWidget {
  const _PopularMovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PopularMovieListBloc, PopularMovieListState>(
        builder: (BuildContext context, PopularMovieListState state) {
          if (state is PopularMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView(
                contents: state.movies.results,
                title: 'Popular',
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}

class _NowPlayingMovieListView extends StatelessWidget {
  const _NowPlayingMovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NowPlayingMovieListBloc, NowPlayingMovieListState>(
        builder: (BuildContext context, NowPlayingMovieListState state) {
          if (state is NowPlayingMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView(
                contents: state.movies.results,
                title: 'Now Playing',
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}

class _TopRatedMovieListView extends StatelessWidget {
  const _TopRatedMovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TopRatedMovieListBloc, TopRatedMovieListState>(
        builder: (BuildContext context, TopRatedMovieListState state) {
          if (state is TopRatedMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView(
                contents: state.movies.results,
                title: 'Top Rated',
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}

class _UpcomingMovieListView extends StatelessWidget {
  const _UpcomingMovieListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UpcomingMovieListBloc, UpcomingMovieListState>(
        builder: (BuildContext context, UpcomingMovieListState state) {
          if (state is UpcomingMovieListSuccess) {
            return Container(
              padding: const EdgeInsets.all(Sizes.dimen_20),
              child: ContentListView(
                contents: state.movies.results,
                title: 'Upcoming',
              ),
            );
          } else if (state is MovieCarouselError) {
            return Container();
          }
          return const SizedBox.shrink();
        },
      );
}
