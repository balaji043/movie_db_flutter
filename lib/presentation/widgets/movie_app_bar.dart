// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/extensions.dart';
import 'package:movie_db/core/screen_util.dart';
import 'package:movie_db/core/sizes_constants.dart';
import 'package:movie_db/presentation/widgets/logo.dart';

class MoviAppBar extends StatelessWidget {
  const MoviAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.hd,
        left: Sizes.dimen_16.wd,
        right: Sizes.dimen_16.wd,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.handyman,
            ),
            onPressed: () {},
          ),
          const Expanded(
            child: Logo(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.hd,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
