import 'package:flutter/material.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/journeys/movies/pages/movie_browse_page.dart';
import 'package:movie_db/presentation/journeys/movies/pages/movie_discover_page.dart';
import 'package:movie_db/presentation/journeys/movies/pages/movie_my_wishlist_page.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/nav_bar.dart';
import 'package:movie_db/presentation/widgets/nav_item.dart';
import 'package:movie_db/presentation/widgets/search_bar.dart';

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.dimen_80),
          child: TopBar(controller: controller),
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

class TopBar extends StatefulWidget {
  final PageController controller;

  const TopBar({Key key, this.controller}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List<NavigationItem> navigationItems = <NavigationItem>[
    NavigationItem(
      label: 'Discover',
      isSelected: true,
    ),
    NavigationItem(
      label: 'Browse',
    )
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(right: Sizes.dimen_20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: Sizes.dimen_20),
              child: NavigationBar(
                axis: Axis.horizontal,
                navigationItems: navigationItems,
                onTap: onTapOfNavItem,
                selectedIndex: currentIndex,
              ),
            ),
            Row(
              children: <Widget>[
                NavItem(
                  selectedIndex: currentIndex,
                  label: 'My Wishlist',
                  index: 2,
                  onTap: onTapOfNavItem,
                ),
                const SizedBox(width: Sizes.dimen_12),
                const SearchBar()
              ],
            )
          ],
        ),
      );

  void onTapOfNavItem(int i) {
    setState(() => currentIndex = i);
    widget.controller.jumpToPage(i);
  }
}
