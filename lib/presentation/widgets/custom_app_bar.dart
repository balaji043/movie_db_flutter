// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/themes/theme_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  const CustomAppBar({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: AppColor.black.withOpacity(0.9),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(right: Sizes.dimen_20),
            child: child,
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.dimen_80);
}
