// Flutter imports:
import 'package:flutter/material.dart';
import 'package:movie_db/core/core.dart';

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
