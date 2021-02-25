// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/core/strings.dart';

class MovieBrowsePage extends StatelessWidget {
  const MovieBrowsePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.green,
        child: const Text(Strings.browse),
      );
}
