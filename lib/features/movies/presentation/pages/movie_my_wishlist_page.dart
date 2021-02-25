// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/core/strings.dart';

class MovieMyWishlistPage extends StatelessWidget {
  const MovieMyWishlistPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.blue,
        child: const Text(Strings.myWishList),
      );
}
