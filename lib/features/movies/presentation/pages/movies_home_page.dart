// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/features/movies/presentation/widgets/movie_app_bar.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/custom_app_bar.dart';
import 'movie_browse_page.dart';
import 'movie_discover_page.dart';
import 'movie_my_wishlist_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
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
        appBar: CustomAppBar(
          child: MovieAppBar(
            controller: controller,
            navigationItems: <NavigationItem>[
              NavigationItem(
                label: 'Discover',
                isSelected: true,
              ),
              NavigationItem(
                label: 'Browse',
              )
            ],
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
