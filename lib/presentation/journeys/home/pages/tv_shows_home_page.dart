// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/core/core.dart';

class TVShowPage extends StatelessWidget {
  const TVShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.blue,
        child: const Center(
          child: Text(Strings.tvShows),
        ),
      );
}
