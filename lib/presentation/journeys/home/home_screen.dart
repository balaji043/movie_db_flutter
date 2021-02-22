// Flutter imports:
import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';

// Project imports:
import 'package:movie_db/presentation/journeys/home/pages/games_home_page.dart';
import 'package:movie_db/presentation/journeys/movies/movies_home_page.dart';
import 'package:movie_db/presentation/journeys/home/pages/people_home_page.dart';
import 'package:movie_db/presentation/journeys/home/pages/tv_shows_home_page.dart';
import 'package:movie_db/presentation/widgets/responsive.dart';
import 'package:movie_db/presentation/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Responsive(
          desktop: Row(
            children: <Widget>[
              Expanded(
                child: SideMenu(
                  onSelectPage: (int page) => pageController.jumpToPage(page),
                ),
              ),
              Expanded(
                flex: Sizes.dimen_4.toInt(),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: const <Widget>[
                    MoviePage(),
                    TVShowPage(),
                    GamesPage(),
                    PeoplePage()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
