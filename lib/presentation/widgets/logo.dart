// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:movie_db/data/core/asset_constants.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    @required this.height,
    Key key,
  })  : assert(height != null, 'Height cannot be null'),
        assert(
          height > 0,
          'Height cannot be less than or equal to 0',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        AssetConstants.tmdbLogo,
        height: height,
        color: Colors.white,
      );
}
