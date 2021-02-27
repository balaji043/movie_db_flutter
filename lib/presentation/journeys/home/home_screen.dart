// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/features/movies/presentation/pages/movie_home_page.dart';
import 'package:movie_db/presentation/cubit/cubits.dart';
import 'package:movie_db/presentation/journeys/home/pages/games_home_page.dart';
import 'package:movie_db/presentation/journeys/home/pages/people_home_page.dart';
import 'package:movie_db/presentation/journeys/home/pages/tv_shows_home_page.dart';
import 'package:movie_db/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeRouteCubit homeRouteBloc;
  MovieCarouselBloc movieCarouselBloc;
  TopRatedMovieListBloc topRatedMovieListBloc;
  UpcomingMovieListBloc upcomingMovieListBloc;
  NowPlayingMovieListBloc nowPlayingMovieListBloc;
  PopularMovieListBloc popularMovieListBloc;
  MovieCarouselCardBloc movieCarouselCardBloc;
  MovieRouteBloc movieRouteBloc;
  MovieDetailsBloc movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    homeRouteBloc = HomeRouteCubit();
    movieRouteBloc = GetIt.I<MovieRouteBloc>();
    movieDetailsBloc = GetIt.I<MovieDetailsBloc>();

    movieCarouselBloc = GetIt.I<MovieCarouselBloc>();
    topRatedMovieListBloc = GetIt.I<TopRatedMovieListBloc>();
    upcomingMovieListBloc = GetIt.I<UpcomingMovieListBloc>();
    nowPlayingMovieListBloc = GetIt.I<NowPlayingMovieListBloc>();
    popularMovieListBloc = GetIt.I<PopularMovieListBloc>();
    movieCarouselCardBloc = GetIt.I<MovieCarouselCardBloc>();
  }

  @override
  void dispose() {
    homeRouteBloc.close();
    movieCarouselBloc.close();
    topRatedMovieListBloc.close();
    upcomingMovieListBloc.close();
    nowPlayingMovieListBloc.close();
    popularMovieListBloc.close();
    movieRouteBloc.close();
    movieDetailsBloc.close();
    movieCarouselCardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const SideMenu sideMenu = SideMenu();
    const PageWidget pageView = PageWidget();
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<MovieRouteBloc>(
          create: (BuildContext context) => movieRouteBloc,
        ),
        BlocProvider<MovieDetailsBloc>(
          create: (BuildContext context) => movieDetailsBloc,
        ),
        BlocProvider<HomeRouteCubit>(
          create: (BuildContext context) => homeRouteBloc,
        ),
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
        key: scaffoldKey,
        drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? sideMenu
            : null,
        body: Responsive(
          desktop: Row(
            children: const <Expanded>[
              Expanded(
                child: sideMenu,
              ),
              Expanded(
                flex: 4,
                child: pageView,
              ),
            ],
          ),
          tablet: pageView,
          mobile: pageView,
        ),
      ),
    );
  }

  void openDrawer() => scaffoldKey.currentState.openDrawer();
}

class PageWidget extends StatelessWidget {
  const PageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeRouteCubit, int>(
        builder: (BuildContext context, int state) => IndexedStack(
          index: state,
          children: const <Widget>[
            MovieHomePage(),
            TVShowPage(),
            GamesPage(),
            PeoplePage()
          ],
        ),
      );
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
