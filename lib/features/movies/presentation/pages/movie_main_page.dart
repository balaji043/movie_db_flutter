// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/core.dart';

// Project imports:
import 'package:movie_db/features/movies/presentation/bloc/bloc.dart';
import 'package:movie_db/features/movies/presentation/widgets/movie_widgets.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/widgets.dart';
import 'movie_browse_page.dart';
import 'movie_discover_page.dart';
import 'movie_my_wishlist_page.dart';

class MovieMainPage extends StatefulWidget {
  const MovieMainPage({Key key}) : super(key: key);

  @override
  _MovieMainPageState createState() => _MovieMainPageState();
}

class _MovieMainPageState extends State<MovieMainPage> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          child: BlocProvider<MovieTabRouteBloc>(
            create: (BuildContext context) => MovieTabRouteBloc(controller),
            child: const MovieAppBar(
              navigationItems: <NavigationItem>[
                NavigationItem(
                  label: Strings.discover,
                  isSelected: true,
                ),
                NavigationItem(
                  label: Strings.browse,
                )
              ],
            ),
          ),
        ),
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            MovieDiscoverPage(),
            MovieBrowsePage(),
            MovieMyWishlistPage()
          ],
        ),
      );
}
