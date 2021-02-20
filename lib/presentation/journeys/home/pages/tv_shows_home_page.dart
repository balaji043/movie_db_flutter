import 'package:flutter/material.dart';
import 'package:movie_db/presentation/widgets/custom_scaffold.dart';

class TVShowPage extends StatelessWidget {
  const TVShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CustomScaffold(
        body: Center(
          child: Text('TV'),
        ),
      );
}
