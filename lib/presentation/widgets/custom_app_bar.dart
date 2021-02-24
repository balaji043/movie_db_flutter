// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

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
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    Widget leading;

    if (hasDrawer) {
      leading = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButton,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          color: AppColor.black.withOpacity(0.9),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(right: Sizes.dimen_20),
          child: Row(
            children: [
              if (leading != null) leading,
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
