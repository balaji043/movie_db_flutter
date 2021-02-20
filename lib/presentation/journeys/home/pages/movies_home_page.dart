import 'package:flutter/cupertino.dart';
import 'package:movie_db/presentation/widgets/custom_scaffold.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CustomScaffold(
        body: Center(
          child: Text('Movie'),
        ),
      );
}
