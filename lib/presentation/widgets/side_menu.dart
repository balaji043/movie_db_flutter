// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/data/core/strings.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/view_models/navigation_item.dart';
import 'package:movie_db/presentation/widgets/logo.dart';
import 'package:movie_db/presentation/widgets/nav_bar.dart';
import 'custom_button.dart';

class SideMenu extends StatefulWidget {
  final Function(int page) onSelectPage;

  const SideMenu({
    this.onSelectPage,
    Key key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int currentIndex = 0;

  List<NavigationItem> navigationItems = const <NavigationItem>[
    NavigationItem(
      isSelected: true,
      icon: Icons.movie,
      label: Strings.movies,
    ),
    NavigationItem(
      icon: Icons.tv,
      label: Strings.tvShows,
    ),
    NavigationItem(
      icon: Icons.games,
      label: Strings.games,
    ),
    NavigationItem(
      icon: Icons.people,
      label: Strings.people,
    ),
  ];

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: AppColor.inactiveWhite,
            ),
          ),
          color: AppColor.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.dimen_40,
            bottom: Sizes.dimen_32,
            left: Sizes.dimen_20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Column>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: Sizes.dimen_10),
                    child: Logo(height: Sizes.dimen_32),
                  ),
                  NavigationBar(
                    navigationItems: navigationItems,
                    axis: Axis.vertical,
                    selectedIndex: currentIndex,
                    onTap: onNavItemTap,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  CustomButton(
                    onPressed: () {},
                    iconSrc: Icons.list,
                    title: Strings.myLists,
                  ),
                  CustomButton(
                    onPressed: () {},
                    iconSrc: Icons.settings,
                    title: Strings.settings,
                  ),
                  CustomButton(
                    onPressed: () {},
                    iconSrc: Icons.person,
                    title: 'balaji043',
                  ),
                ],
              )
            ],
          ),
        ),
      );

  void onNavItemTap(int i) {
    setState(() => currentIndex = i);
    widget.onSelectPage(currentIndex);
  }
}
