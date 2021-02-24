// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/di/get_di.dart';
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/features/movies/presentation/pages/movie_home_page.dart';
import 'package:movie_db/presentation/bloc/home_route/home_route_bloc.dart';
import 'package:movie_db/presentation/journeys/home/pages/games_home_page.dart';
import 'package:movie_db/presentation/journeys/home/pages/people_home_page.dart';
import 'package:movie_db/presentation/journeys/home/pages/tv_shows_home_page.dart';
import 'package:movie_db/presentation/widgets/responsive.dart';
import 'package:movie_db/presentation/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  HomeRouteBloc homeRouteBloc;
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
    pageController = PageController();
    homeRouteBloc = HomeRouteBloc(pageController);
    movieRouteBloc = getItInstance<MovieRouteBloc>();
    movieDetailsBloc = getItInstance<MovieDetailsBloc>();

    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    topRatedMovieListBloc = getItInstance<TopRatedMovieListBloc>();
    upcomingMovieListBloc = getItInstance<UpcomingMovieListBloc>();
    nowPlayingMovieListBloc = getItInstance<NowPlayingMovieListBloc>();
    popularMovieListBloc = getItInstance<PopularMovieListBloc>();
    movieCarouselCardBloc = getItInstance<MovieCarouselCardBloc>();
  }

  @override
  void dispose() {
    pageController.dispose();
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
    final SideMenu sideMenu = SideMenu();
    final PageView pageView = PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: const <Widget>[
        MovieHomePage(),
        TVShowPage(),
        GamesPage(),
        PeoplePage()
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieRouteBloc>(
          create: (BuildContext context) => movieRouteBloc,
        ),
        BlocProvider<MovieDetailsBloc>(
          create: (BuildContext context) => movieDetailsBloc,
        ),
        BlocProvider(create: (context) => homeRouteBloc),
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
        drawer: Responsive.isMobile(context) ? sideMenu : null,
        body: Responsive(
          desktop: Row(
            children: <Expanded>[
              Expanded(
                child: sideMenu,
              ),
              Expanded(
                flex: Sizes.dimen_4.toInt(),
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

  void openDrawer() {
    scaffoldKey.currentState.openDrawer();
  }
}

final scaffoldKey = GlobalKey<ScaffoldState>();
