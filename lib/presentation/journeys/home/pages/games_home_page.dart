// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/core/strings.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: Text(Strings.games),
      );
}
