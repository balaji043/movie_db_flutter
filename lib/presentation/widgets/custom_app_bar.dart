// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/journeys/home/home_screen.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';
import 'package:movie_db/presentation/widgets/responsive.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget child;
  const CustomAppBar({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.dimen_80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _handleDrawerButton() {
    scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: AppColor.black.withOpacity(0.9),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(right: Sizes.dimen_20),
            child: Row(
              children: <Widget>[
                if (!Responsive.isDesktop(context))
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: _handleDrawerButton,
                    color: AppColor.white,
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                Expanded(
                  child: widget.child,
                ),
              ],
            ),
          ),
        ),
      );
}
