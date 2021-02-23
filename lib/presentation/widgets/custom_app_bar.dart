// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/sizes_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  const CustomAppBar({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(right: Sizes.dimen_20),
        child: child,
      );

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.dimen_80);
}
