import 'package:flutter/material.dart';

import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/widgets/logo.dart';

import 'custom_button.dart';
import 'custom_tab_widget.dart';

class SideMenu extends StatefulWidget {
  final PageController controller;
  const SideMenu({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: AppColor.inactiveWhite,
            ),
          ),
          color: AppColor.black,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Column>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(bottom: Sizes.dimen_10),
                          child: Logo(height: Sizes.dimen_32),
                        ),
                        CustomTabWidget(
                          title: 'Movies',
                          iconData: Icons.movie,
                          controller: widget.controller,
                          index: 0,
                          currentIndex: currentIndex,
                          setCurrentIndex: setCurrentIndex,
                        ),
                        CustomTabWidget(
                          title: 'TV Shows',
                          iconData: Icons.tv,
                          controller: widget.controller,
                          index: 1,
                          currentIndex: currentIndex,
                          setCurrentIndex: setCurrentIndex,
                        ),
                        CustomTabWidget(
                          title: 'Games',
                          iconData: Icons.gamepad,
                          controller: widget.controller,
                          index: 2,
                          currentIndex: currentIndex,
                          setCurrentIndex: setCurrentIndex,
                        ),
                        CustomTabWidget(
                          title: 'People',
                          iconData: Icons.movie,
                          controller: widget.controller,
                          index: 3,
                          currentIndex: currentIndex,
                          setCurrentIndex: setCurrentIndex,
                        ),
                      ],
                    ),
                    Column(
                      children: <CustomButton>[
                        CustomButton(
                          press: () {},
                          iconSrc: Icons.list,
                          title: 'My Lists',
                        ),
                        CustomButton(
                          press: () {},
                          iconSrc: Icons.settings,
                          title: 'Settings',
                        ),
                        CustomButton(
                          press: () {},
                          iconSrc: Icons.person,
                          title: 'balaji043',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  void setCurrentIndex(int index) => setState(() => currentIndex = index);
}
