import 'package:flutter/cupertino.dart';
import 'package:movie_db/presentation/widgets/custom_scaffold.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CustomScaffold(
        body: Center(
          child: Text('People'),
        ),
      );
}
