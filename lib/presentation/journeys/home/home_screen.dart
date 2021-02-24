// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
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

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    homeRouteBloc = HomeRouteBloc(pageController);
  }

  @override
  void dispose() {
    pageController.dispose();
    homeRouteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const SideMenu sideMenu = SideMenu();
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

    return BlocProvider<HomeRouteBloc>(
      create: (context) => homeRouteBloc,
      child: Scaffold(
        key: scaffoldKey,
        drawer: sideMenu,
        body: Responsive(
          desktop: Row(
            children: <Expanded>[
              const Expanded(
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
