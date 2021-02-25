// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/core/strings.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: Text(Strings.people),
      );
}
