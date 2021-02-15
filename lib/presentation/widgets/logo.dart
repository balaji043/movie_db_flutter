import 'package:flutter/material.dart';
import 'package:movie_db/data/core/asset_constants.dart';
import 'package:movie_db/core/extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key key, @required this.height})
      : assert(height != null, 'Height cannot be null'),
        assert(
          height > 0,
          'Height cannot be less than or equal to 0',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetConstants.tmdbLogo,
      height: height.hd,
      color: Colors.white,
    );
  }
}
