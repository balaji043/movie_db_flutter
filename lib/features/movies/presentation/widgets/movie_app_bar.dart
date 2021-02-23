// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/nav_bar.dart';
import 'package:movie_db/presentation/widgets/nav_item_widget.dart';
import 'package:movie_db/presentation/widgets/search_bar.dart';

class MovieAppBar extends StatefulWidget {
  final PageController controller;
  final List<NavigationItem> navigationItems;

  const MovieAppBar({
    @required this.controller,
    @required this.navigationItems,
    Key key,
  }) : super(key: key);

  @override
  _MovieAppBarState createState() => _MovieAppBarState();
}

class _MovieAppBarState extends State<MovieAppBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: Sizes.dimen_20),
            child: NavigationBar(
              axis: Axis.horizontal,
              navigationItems: widget.navigationItems,
              onTap: onTapOfNavItem,
              selectedIndex: currentIndex,
            ),
          ),
          Row(
            children: <Widget>[
              NavItemWidget(
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
      );

  void onTapOfNavItem(int i) {
    setState(() => currentIndex = i);
    widget.controller.jumpToPage(i);
  }
}
