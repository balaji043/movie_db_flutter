// Flutter imports:
import 'package:flutter/material.dart';
import 'package:movie_db/data/core/strings.dart';

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
