// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:transparent_image/transparent_image.dart';

// Project imports:
import 'package:movie_db/data/core/api_constants.dart';

class BackdropImage extends StatelessWidget {
  const BackdropImage({
    @required this.backdropPath,
    Key key,
  }) : super(key: key);

  final String backdropPath;

  @override
  Widget build(BuildContext context) => FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: getBDUrl(backdropPath, ImageUrl.w1280),
        fit: BoxFit.fitHeight,
      );
}
